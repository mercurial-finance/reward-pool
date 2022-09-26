use crate::state::*;
use anchor_lang::prelude::*;
use anchor_lang::solana_program::sysvar;
use anchor_spl::token::{Mint, Token, TokenAccount};
use std::convert::TryInto;

/// Accounts for [InitializePool](/single_farming/instruction/struct.InitializePool.html) instruction
#[derive(Accounts)]
pub struct InitializePool<'info> {
    /// The farming pool PDA.
    #[account(
        init,
        payer = admin,
        space = 250 // 1 + 177 + buffer
    )]
    pub pool: Box<Account<'info, Pool>>,

    /// The staking vault PDA.
    #[account(
        init,
        seeds = [b"staking_vault".as_ref(), pool.key().as_ref()],
        bump,
        payer = admin,
        token::mint = staking_mint,
        token::authority = staking_vault,
    )]
    pub staking_vault: Box<Account<'info, TokenAccount>>,
    /// The staking Mint.
    pub staking_mint: Box<Account<'info, Mint>>,
    /// The xMER reward Mint.
    pub xmer_reward_mint: Box<Account<'info, Mint>>,
    /// The reward Vault PDA.
    #[account(
        init,
        seeds = [b"xmer_reward_vault".as_ref(), pool.key().as_ref()],
        bump,
        payer = admin,
        token::mint = xmer_reward_mint,
        token::authority = staking_vault,
    )]
    pub xmer_reward_vault: Box<Account<'info, TokenAccount>>,

    /// The authority of the pool   
    #[account(mut)]
    pub admin: Signer<'info>,

    /// Token Program
    pub token_program: Program<'info, Token>,
    /// Rent
    pub rent: Sysvar<'info, Rent>,
    /// System program
    pub system_program: Program<'info, System>,
}

/// Accounts for [ActivateFarming](/single_farming/instruction/struct.ActivateFarming.html) instruction
#[derive(Accounts)]
pub struct ActivateJupFarming<'info> {
    #[account(
        mut,
        has_one = admin,
    )]
    /// The farming pool PDA.
    pub pool: Box<Account<'info, Pool>>,
    /// The admin of the pool
    pub admin: Signer<'info>,
}

/// Accounts for [AuthorizeFunder](/dual_farming/instruction/struct.AuthorizeFunder.html)
/// and [DeauthorizeFunder](/dual_farming/instruction/struct.DeauthorizeFunder.html) instructions.
#[derive(Accounts)]
pub struct FunderChange<'info> {
    /// Global accounts for the staking instance.
    #[account(
        mut,
        has_one = admin,
    )]
    pub pool: Box<Account<'info, Pool>>,
    /// Admin of the pool
    pub admin: Signer<'info>,
}

/// Accounts for [FundXMer](/staking/instruction/struct.Fund.html) instruction.
#[derive(Accounts)]
pub struct FundXMer<'info> {
    /// Global accounts for the staking instance.
    #[account(
        mut,
        has_one = staking_vault,
        has_one = xmer_reward_vault,
    )]
    pub pool: Box<Account<'info, Pool>>,
    /// Staking vault PDA
    #[account(mut)]
    pub staking_vault: Box<Account<'info, TokenAccount>>,
    /// Reward xMER Vault PDA
    #[account(mut)]
    pub xmer_reward_vault: Box<Account<'info, TokenAccount>>,
    /// Funder
    #[account(
        //require signed funder auth - otherwise constant micro fund could hold funds hostage
        constraint = funder.key() == pool.admin || pool.funders.iter().any(|x| *x == funder.key()),
    )]
    pub funder: Signer<'info>,
    /// Funder reward xMER ATA
    #[account(mut)]
    pub from_xmer: Box<Account<'info, TokenAccount>>,
    /// Misc.
    pub token_program: Program<'info, Token>,
}

/// Accounts for [CreateUser](/single_farming/instruction/struct.CreateUser.html) instruction
#[derive(Accounts)]
pub struct CreateUser<'info> {
    /// The farming pool PDA.
    pub pool: Box<Account<'info, Pool>>,
    /// User staking PDA.
    #[account(
        init,
        payer = owner,
        seeds = [
            owner.key.as_ref(),
            pool.key().as_ref()
        ],
        bump,
        space = 120 // 1 + 97 + buffer
    )]
    pub user: Box<Account<'info, User>>,
    /// The authority of user
    #[account(mut)]
    pub owner: Signer<'info>,
    /// System Program
    pub system_program: Program<'info, System>,
}

/// Accounts for [Deposit](/single_farming/instruction/struct.Deposit.html) instruction and [Withdraw](/single_farming/instruction/struct.Withdraw.html) instruction
#[derive(Accounts)]
pub struct DepositOrWithdraw<'info> {
    /// The farming pool PDA.
    #[account(
        mut,
        has_one = staking_vault,
    )]
    pub pool: Box<Account<'info, Pool>>,
    /// The staking vault PDA.
    #[account(mut)]
    pub staking_vault: Box<Account<'info, TokenAccount>>,

    /// User staking PDA.
    #[account(
        mut,
        has_one = owner,
        has_one = pool,
    )]
    pub user: Box<Account<'info, User>>,
    /// The authority of user
    pub owner: Signer<'info>,
    /// The user ATA
    #[account(mut)]
    pub stake_from_account: Box<Account<'info, TokenAccount>>,

    /// Token program
    pub token_program: Program<'info, Token>,
}

/// Accounts for [Claim](/single_farming/instruction/struct.Claim.html) instruction
#[derive(Accounts)]
pub struct ClaimXMerReward<'info> {
    /// The farming pool PDA.
    #[account(
        mut,
        has_one = staking_vault,
        has_one = xmer_reward_vault,
    )]
    pub pool: Box<Account<'info, Pool>>,
    /// The staking vault PDA.
    pub staking_vault: Box<Account<'info, TokenAccount>>,
    /// Vault of the pool, which store the xMER to be distributed
    #[account(mut)]
    pub xmer_reward_vault: Box<Account<'info, TokenAccount>>,

    /// User staking PDA.
    #[account(
        mut,
        has_one = owner,
        has_one = pool,
    )]
    pub user: Box<Account<'info, User>>,
    /// The authority of user
    pub owner: Signer<'info>,
    /// User token account to receive xMER reward
    #[account(mut)]
    pub xmer_reward_account: Box<Account<'info, TokenAccount>>,

    /// Token program
    pub token_program: Program<'info, Token>,
}

/// Accounts for [CloseUser](/single_farming/instruction/struct.CloseUser.html) instruction
#[derive(Accounts)]
pub struct CloseUser<'info> {
    /// The farming pool PDA.
    pub pool: Box<Account<'info, Pool>>,
    #[account(
        mut,
        close = owner,
        has_one = owner,
        has_one = pool,
        constraint = user.balance_staked == 0,
        constraint = user.jup_reward_per_token_pending == 0,
    )]
    /// User account to be close
    pub user: Account<'info, User>,
    /// Owner of the user account
    pub owner: Signer<'info>,
}

/// Accounts for [WithdrawExtraToken](/single_farming/instruction/struct.WithdrawExtraToken.html) instruction
#[derive(Accounts)]
pub struct WithdrawExtraToken<'info> {
    /// Global accounts for the staking instance.
    #[account(
        has_one = staking_vault,
        has_one = admin,
        constraint = pool.jup_reward_end_timestamp < sysvar::clock::Clock::get().unwrap().unix_timestamp.try_into().unwrap(),
    )]
    pub pool: Box<Account<'info, Pool>>,
    /// Staking vault PDA
    #[account(mut)]
    pub staking_vault: Box<Account<'info, TokenAccount>>,
    /// Token account to receive mistakenly deposited token
    #[account(mut)]
    pub withdraw_to_account: Box<Account<'info, TokenAccount>>,

    /// Admin of the staking instance
    pub admin: Signer<'info>,
    /// Misc.
    pub token_program: Program<'info, Token>,
}
