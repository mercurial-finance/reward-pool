//! Single farming program
#![deny(rustdoc::all)]
#![allow(rustdoc::missing_doc_code_examples)]
#![warn(clippy::unwrap_used)]
#![warn(clippy::integer_arithmetic)]
#![warn(missing_docs)]

use crate::context::*;

use crate::error::ErrorCode;
use crate::utils::rate_by_funding;
use anchor_lang::prelude::*;
use anchor_lang::solana_program::clock;
use anchor_spl::token;
use std::convert::Into;
use std::convert::TryInto;

/// Export for context implementation
pub mod context;
/// Define error code
pub mod error;
/// Export for pool implementation
pub mod state;
/// Export for utils implementation
pub mod utils;

declare_id!("9D9cdG8WV336qsjWe6PeMkqcsBmAWTZhddQgTfQrsHqc");

/// Single farming program
#[program]
pub mod single_farming {
    use super::*;

    /// Initializes a new pool
    pub fn initialize_pool(
        ctx: Context<InitializePool>,
        jup_reward_duration: u64,
        jup_funding_amount: u64,
        xmer_reward_duration: u64,
    ) -> Result<()> {
        if jup_reward_duration == 0 {
            return Err(ErrorCode::JupDurationCannotBeZero.into());
        }

        let pool = &mut ctx.accounts.pool;
        // This is safe as long as the key matched the account in InitializePool context
        pool.staking_vault_nonce = *ctx.bumps.get("staking_vault").unwrap();
        pool.staking_mint = ctx.accounts.staking_mint.key();
        pool.staking_vault = ctx.accounts.staking_vault.key();

        // update jup  info
        pool.jup_reward_duration = jup_reward_duration;
        pool.total_staked = 0;
        pool.jup_last_update_time = 0;
        pool.jup_reward_end_timestamp = 0;
        pool.admin = ctx.accounts.admin.key();
        pool.jup_reward_rate = rate_by_funding(jup_funding_amount, jup_reward_duration)
            .ok_or(ErrorCode::MathOverFlow)?;
        pool.jup_reward_per_token_stored = 0;

        // update xmer info
        pool.xmer_reward_duration = xmer_reward_duration;
        pool.xmer_reward_mint = ctx.accounts.xmer_reward_mint.key();
        pool.xmer_reward_vault = ctx.accounts.xmer_reward_vault.key();
        pool.xmer_last_update_time = 0;
        pool.xmer_reward_end_timestamp = 0;
        pool.xmer_reward_per_token_stored = 0;
        Ok(())
    }

    /// Admin activates jup farming
    pub fn activate_jup_farming<'a, 'b, 'c, 'info>(
        ctx: Context<'a, 'b, 'c, 'info, ActivateJupFarming<'info>>,
    ) -> Result<()> {
        let pool = &mut ctx.accounts.pool;
        let current_time = clock::Clock::get()
            .unwrap()
            .unix_timestamp
            .try_into()
            .unwrap();
        pool.jup_last_update_time = current_time;
        pool.jup_reward_end_timestamp = current_time
            .checked_add(pool.jup_reward_duration)
            .ok_or(ErrorCode::MathOverFlow)?;
        Ok(())
    }

    /// Authorize additional funders for the pool
    pub fn authorize_funder(ctx: Context<FunderChange>, funder_to_add: Pubkey) -> Result<()> {
        if funder_to_add == ctx.accounts.pool.admin.key() {
            return Err(ErrorCode::FunderAlreadyAuthorized.into());
        }
        let funders = &mut ctx.accounts.pool.funders;
        if funders.iter().any(|x| *x == funder_to_add) {
            return Err(ErrorCode::FunderAlreadyAuthorized.into());
        }
        let default_pubkey = Pubkey::default();
        if let Some(idx) = funders.iter().position(|x| *x == default_pubkey) {
            funders[idx] = funder_to_add;
            emit!(EventAuthorizeFunder {
                new_funder: funder_to_add
            });
        } else {
            return Err(ErrorCode::MaxFunders.into());
        }
        Ok(())
    }

    /// Deauthorize funders for the pool
    pub fn deauthorize_funder(ctx: Context<FunderChange>, funder_to_remove: Pubkey) -> Result<()> {
        if funder_to_remove == ctx.accounts.pool.admin.key() {
            return Err(ErrorCode::CannotDeauthorizePoolAdmin.into());
        }
        let funders = &mut ctx.accounts.pool.funders;
        if let Some(idx) = funders.iter().position(|x| *x == funder_to_remove) {
            funders[idx] = Pubkey::default();
            emit!(EventUnauthorizeFunder {
                funder: funder_to_remove
            });
        } else {
            return Err(ErrorCode::CannotDeauthorizeMissingAuthority.into());
        }
        Ok(())
    }

    /// Fund the pool with xMER rewards.  This resets the clock on the end date, pushing it out to the set duration. And, linearly redistributes remaining rewards.
    pub fn fund_xmer(ctx: Context<FundXMer>, amount: u64) -> Result<()> {
        let pool = &mut ctx.accounts.pool;

        pool.update_xmer_rewards(None).unwrap();

        let xmer_reward_rate = pool.xmer_rate_after_funding(amount)?;
        pool.xmer_reward_rate = xmer_reward_rate;

        // Transfer reward A tokens into the A vault.
        if amount > 0 {
            let cpi_ctx = CpiContext::new(
                ctx.accounts.token_program.to_account_info(),
                token::Transfer {
                    from: ctx.accounts.from_xmer.to_account_info(),
                    to: ctx.accounts.xmer_reward_vault.to_account_info(),
                    authority: ctx.accounts.funder.to_account_info(),
                },
            );

            token::transfer(cpi_ctx, amount)?;
        }

        let current_time = clock::Clock::get()
            .unwrap()
            .unix_timestamp
            .try_into()
            .unwrap();
        pool.xmer_last_update_time = current_time;
        pool.xmer_reward_end_timestamp =
            current_time.checked_add(pool.xmer_reward_duration).unwrap();

        emit!(EventFund { amount });
        Ok(())
    }

    /// Initialize a user staking account
    pub fn create_user<'a, 'b, 'c, 'info>(
        ctx: Context<'a, 'b, 'c, 'info, CreateUser<'info>>,
    ) -> Result<()> {
        let user = &mut ctx.accounts.user;
        user.pool = *ctx.accounts.pool.to_account_info().key;
        user.owner = *ctx.accounts.owner.key;
        user.jup_reward_per_token_complete = 0;
        user.jup_reward_per_token_pending = 0;
        user.xmer_reward_per_token_complete = 0;
        user.xmer_reward_per_token_pending = 0;
        user.balance_staked = 0;
        user.nonce = *ctx.bumps.get("user").unwrap();
        Ok(())
    }

    /// A user deposit all tokens into the pool.
    pub fn deposit_full(ctx: Context<DepositOrWithdraw>) -> Result<()> {
        let full_amount = ctx.accounts.stake_from_account.amount;
        deposit(ctx, full_amount)
    }

    /// A user deposit tokens in the pool.
    pub fn deposit(ctx: Context<DepositOrWithdraw>, amount: u64) -> Result<()> {
        if amount == 0 {
            return Err(ErrorCode::AmountMustBeGreaterThanZero.into());
        }
        let pool = &mut ctx.accounts.pool;
        let user_opt = &mut ctx.accounts.user;

        // update rewards for both jup and xMER
        pool.update_jup_rewards(user_opt)?;
        pool.update_xmer_rewards(Some(user_opt))?;

        ctx.accounts.user.balance_staked = ctx
            .accounts
            .user
            .balance_staked
            .checked_add(amount)
            .unwrap();

        // Transfer tokens into the stake vault.
        {
            let cpi_ctx = CpiContext::new(
                ctx.accounts.token_program.to_account_info(),
                token::Transfer {
                    from: ctx.accounts.stake_from_account.to_account_info(),
                    to: ctx.accounts.staking_vault.to_account_info(),
                    authority: ctx.accounts.owner.to_account_info(), //todo use user account as signer
                },
            );
            token::transfer(cpi_ctx, amount)?;
            pool.total_staked = pool
                .total_staked
                .checked_add(amount)
                .ok_or(ErrorCode::MathOverFlow)?;
        }
        Ok(())
    }

    /// A user withdraw tokens in the pool.
    pub fn withdraw(ctx: Context<DepositOrWithdraw>, spt_amount: u64) -> Result<()> {
        if spt_amount == 0 {
            return Err(ErrorCode::AmountMustBeGreaterThanZero.into());
        }

        let pool = &mut ctx.accounts.pool;

        if ctx.accounts.user.balance_staked < spt_amount {
            return Err(ErrorCode::InsufficientFundUnstake.into());
        }

        let user_opt = &mut ctx.accounts.user;
        pool.update_jup_rewards(user_opt)?;
        pool.update_xmer_rewards(Some(user_opt))?;
        ctx.accounts.user.balance_staked = ctx
            .accounts
            .user
            .balance_staked
            .checked_sub(spt_amount)
            .ok_or(ErrorCode::CannotUnstakeMoreThanBalance)?;

        // Transfer tokens from the pool vault to user vault.
        {
            let pool_key = pool.key();

            let seeds = &[
                b"staking_vault".as_ref(),
                pool_key.as_ref(),
                &[pool.staking_vault_nonce],
            ];
            let pool_signer = &[&seeds[..]];

            let cpi_ctx = CpiContext::new_with_signer(
                ctx.accounts.token_program.to_account_info(),
                token::Transfer {
                    from: ctx.accounts.staking_vault.to_account_info(),
                    to: ctx.accounts.stake_from_account.to_account_info(),
                    authority: ctx.accounts.staking_vault.to_account_info(),
                },
                pool_signer,
            );
            token::transfer(cpi_ctx, spt_amount)?;
            pool.total_staked = pool
                .total_staked
                .checked_sub(spt_amount)
                .ok_or(ErrorCode::MathOverFlow)?;
        }

        Ok(())
    }

    /// Withdraw token that mistakenly deposited to staking_vault
    pub fn withdraw_extra_token(ctx: Context<WithdrawExtraToken>) -> Result<()> {
        let pool = &ctx.accounts.pool;
        let total_amount = ctx.accounts.staking_vault.amount;
        let total_staked = pool.total_staked;
        let withdrawable_amount = total_amount
            .checked_sub(total_staked)
            .ok_or(ErrorCode::MathOverFlow)?;

        if withdrawable_amount > 0 {
            let pool_pubkey = pool.key();
            let seeds = &[
                b"staking_vault".as_ref(),
                pool_pubkey.as_ref(),
                &[pool.staking_vault_nonce],
            ];
            let pool_signer = &[&seeds[..]];
            let cpi_ctx = CpiContext::new_with_signer(
                ctx.accounts.token_program.to_account_info(),
                token::Transfer {
                    from: ctx.accounts.staking_vault.to_account_info(),
                    to: ctx.accounts.withdraw_to_account.to_account_info(),
                    authority: ctx.accounts.staking_vault.to_account_info(),
                },
                pool_signer,
            );

            token::transfer(cpi_ctx, withdrawable_amount)?;
        }

        Ok(())
    }

    /// A user claiming xmer
    pub fn claim_xmer(ctx: Context<ClaimXMerReward>) -> Result<()> {
        let pool = &mut ctx.accounts.pool;
        let user_opt = &mut ctx.accounts.user;
        pool.update_jup_rewards(user_opt)?;
        pool.update_xmer_rewards(Some(user_opt))?;

        let pool_key = pool.key();
        let seeds = &[
            b"staking_vault".as_ref(),
            pool_key.as_ref(),
            &[pool.staking_vault_nonce],
        ];
        let pool_signer = &[&seeds[..]];

        // emit pending reward
        emit!(EventPendingReward {
            value: ctx.accounts.user.xmer_reward_per_token_pending,
        });
        if ctx.accounts.user.xmer_reward_per_token_pending > 0 {
            let xmer_reward_per_token_pending = ctx.accounts.user.xmer_reward_per_token_pending;
            let vault_balance = ctx.accounts.xmer_reward_vault.amount;

            // probably precision loss issue, so we send user max balance the vault has
            let reward_amount = if vault_balance < xmer_reward_per_token_pending {
                vault_balance
            } else {
                xmer_reward_per_token_pending
            };
            if reward_amount > 0 {
                ctx.accounts.user.xmer_reward_per_token_pending = 0;

                let cpi_ctx = CpiContext::new_with_signer(
                    ctx.accounts.token_program.to_account_info(),
                    token::Transfer {
                        from: ctx.accounts.xmer_reward_vault.to_account_info(),
                        to: ctx.accounts.xmer_reward_account.to_account_info(),
                        authority: ctx.accounts.staking_vault.to_account_info(),
                    },
                    pool_signer,
                );
                token::transfer(cpi_ctx, reward_amount)?;
                emit!(EventClaimReward {
                    value: reward_amount,
                });
            }
        }

        Ok(())
    }

    /// Closes a users stake account. Validation is done to ensure this is only allowed when
    /// the user has nothing staked and no rewards pending.
    pub fn close_user(_ctx: Context<CloseUser>) -> Result<()> {
        Ok(())
    }
}

/// EventPendingReward
#[event]
pub struct EventPendingReward {
    /// Pending reward amount
    pub value: u64,
}

/// EventClaimReward
#[event]
pub struct EventClaimReward {
    /// Claim reward amount
    pub value: u64,
}

/// Authorized funder event
#[event]
pub struct EventAuthorizeFunder {
    new_funder: Pubkey,
}

/// Un-authorized funder event
#[event]
pub struct EventUnauthorizeFunder {
    funder: Pubkey,
}

/// Fund event
#[event]
pub struct EventFund {
    amount: u64,
}
