import { PublicKey } from "@solana/web3.js";

export const FARMING_API_ENDPOINT = Object.freeze({
  devnet: "https://dev-mer-amm.raccoons.dev/farms",
  "mainnet-beta": "https://amm.meteora.ag/farms",
});

export const FARM_PROGRAM_ID = new PublicKey(
  "FarmuwXPWXvefWUeqFAa5w6rifLkq5X6E8bimYvrhCB1"
);

export const AMM_PROGRAM_ID = new PublicKey(
  "Eo7WjKq67rjJQSZxS6z3YkapzY3eMj6Xy8X5EQVn5UaB"
);

export const SIMULATION_USER = new PublicKey(
  "HrY9qR5TiB2xPzzvbBu5KrBorMfYGQXh9osXydz4jy9s"
);
