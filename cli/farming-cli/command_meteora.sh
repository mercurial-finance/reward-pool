Create pool

1. aaUSDT-4Pool
cargo run -- init --staking-mint FFM9rneg7pFbedUbuJdrwzje9WfKzJzv7jqcpeUQuGCy --reward-a-mint METDftWNfnkTcnEwh7sovtdiUeo2RjxSAsPQYFrWWGD --reward-b-mint a11bdAAuV8iB2fu7X6AxAvDTo1QZ8FXB3kk5eecdasp --reward-duration 3628800 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 9VCYdv5JFQEiMRjuCwSrUNF1ng3VHFbj4dhqv3pHgRS8 --funder 8yo6pCFMyWt46PmFY9z76c119vz5LEqA4FmhJTFA2YU9  // for sam

2. abBUSD-4Pool
cargo run -- init --staking-mint JAQai7Pd6TP2ca3qowQoRw2Qygrhh7PpoLPAf9jvvgMQ --reward-a-mint METDftWNfnkTcnEwh7sovtdiUeo2RjxSAsPQYFrWWGD --reward-b-mint a11bdAAuV8iB2fu7X6AxAvDTo1QZ8FXB3kk5eecdasp --reward-duration 3628800 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json

3. aUSDC-4Pool
cargo run -- init --staking-mint 5ZDQYA8LN5tooABpPFCrDwx5wcaTgXMragLwFim27mar --reward-a-mint METDftWNfnkTcnEwh7sovtdiUeo2RjxSAsPQYFrWWGD --reward-b-mint a11bdAAuV8iB2fu7X6AxAvDTo1QZ8FXB3kk5eecdasp --reward-duration 3628800 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 9dGX6N3FLAVfKmvtkwHA9MVGsvEqGKnLFDQQFbw5dprr --funder BULRqL3U2jPgwvz6HYCyBVq9BMtK94Y1Nz98KQop23aD

4. acUSD-USDC
cargo run -- init --staking-mint 3mtMyBrCf48tJ1XmMnoYZgQqqn6VNEYAfKHzGZnfAZPt --reward-a-mint METDftWNfnkTcnEwh7sovtdiUeo2RjxSAsPQYFrWWGD --reward-b-mint a11bdAAuV8iB2fu7X6AxAvDTo1QZ8FXB3kk5eecdasp --reward-duration 3628800 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json

5. afUSDC-USDC
cargo run -- init --staking-mint FmQSveFkR6Z2hbkA5WDNwLdo4xdsS1C8gR5bCu8Zpdsu --reward-a-mint METDftWNfnkTcnEwh7sovtdiUeo2RjxSAsPQYFrWWGD --reward-b-mint a11bdAAuV8iB2fu7X6AxAvDTo1QZ8FXB3kk5eecdasp --reward-duration 3628800 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- show-info --pool 9Jh5pRf9wwemN6V1EkvFmNrnkz5K4fHz35svj19vWrcP


6. stSOl-SOL 
cargo run -- init --staking-mint 4q19vhpG6y4ZeMPLQiUNNaJStb8XivCFQy4m4mdnVnQZ --reward-a-mint METDftWNfnkTcnEwh7sovtdiUeo2RjxSAsPQYFrWWGD --reward-b-mint HZRCwxP2Vq9PCpPXooayhJ2bxTpo5xfpQrwB1svh332p --reward-duration 3628800 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool BemLvypFWv85WSR5Ck3LGdaKfaXaeiu8iWJziTELn5cS --funder D7PY6TzZRiNJwcZKaQStjjpU3KcfP6kVhrV69wrrgUXG
cargo run -- authorize --pool BemLvypFWv85WSR5Ck3LGdaKfaXaeiu8iWJziTELn5cS --funder BULRqL3U2jPgwvz6HYCyBVq9BMtK94Y1Nz98KQop23aD
cargo run -- authorize --pool BemLvypFWv85WSR5Ck3LGdaKfaXaeiu8iWJziTELn5cS --funder JBeYA7dmBGCNgaEdtqdoUnESwKJho5YvgXVNLgo4n3MM

cargo run -- show-info --pool 9dGX6N3FLAVfKmvtkwHA9MVGsvEqGKnLFDQQFbw5dprr


7. Shaky pool 
cargo run -- init --staking-mint GtdtFFFzDDZyidu8Wo796L3PqWvME7Y9ERuGLLmh3c9q --reward-a-mint EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v --reward-b-mint Fishy64jCaa3ooqXw7BHtKvYD8BTkSyAPh6RNE3xZpcN --reward-duration 3628800 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- show-info --pool FwukcKkqDsCc1WxHrhdkk1oRdfbMvKQzBH7jK3bCathf
cargo run -- authorize --pool FwukcKkqDsCc1WxHrhdkk1oRdfbMvKQzBH7jK3bCathf --funder 47sMzrVW41PYFvZX2ak1joFfC394gQmTuu5wGmbMyvBe


8. Food-bonk 
cargo run -- init --staking-mint CGNzczidTtNq5TZd3vNc4BGApWPt57Xgn5jrRLbFKHEX --reward-a-mint EcK2evV2cDECVsmvY2FxU51eu3fp4w48zrZxuA92AAAN --reward-b-mint DezXAZ8z7PnrnRJjz3wXBoRgixCa6xjnB7YaB1pPB263 --reward-duration 1209600 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool CP9ML152UJW6APq96rEuqt8eijBTa5uJ62tP3Uo5vhL7 --funder 27tTqhSwT4ZUXRfA2gBM5XCRSyb5CS2Q7cv7w7amdfLA


9. ARB-SOL
cargo run -- init --staking-mint DJAYBSkBDp2X7UtD7Tobpu8N2vSVp9nyvpY4Ps9JDjgZ --reward-a-mint 9tzZzEHsKnwFL1A3DyFJwj36KnZj3gZ7g4srWp9YTEoh --reward-b-mint 9tzZzEHsKnwFL1A3DyFJwj36KnZj3gZ7g4srWp9YTEoh --reward-duration 1209600 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool CXS69MGyEuGvQEzG5Z4wicMUk7rj3X5JjmjAGodkxkdV --funder BoeenN1SEj8kuLUvnwFFhjhDQNszRa2W9Ay54pwNia11
cargo run -- show-info --pool CXS69MGyEuGvQEzG5Z4wicMUk7rj3X5JjmjAGodkxkdV

10. ARB_USDC
cargo run -- init --staking-mint Cq1SJhkLWXCtsEGyPnUdeTVQXT8QGw9LpbZCwDXf7aAJ --reward-a-mint 9tzZzEHsKnwFL1A3DyFJwj36KnZj3gZ7g4srWp9YTEoh --reward-b-mint 9tzZzEHsKnwFL1A3DyFJwj36KnZj3gZ7g4srWp9YTEoh --reward-duration 1209600 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 9SZSzNxXWaqkYpjCD3bvamJShBq2xcwuYZJNHKDRm6m7 --funder 27tTqhSwT4ZUXRfA2gBM5XCRSyb5CS2Q7cv7w7amdfLA


10. Bonk-SOL
cargo run -- init --staking-mint D3RzDiVmZ5dm1CF842LMFuZ6DAWmfZvz63v4ubG7EmM4 --reward-a-mint DezXAZ8z7PnrnRJjz3wXBoRgixCa6xjnB7YaB1pPB263 --reward-b-mint DezXAZ8z7PnrnRJjz3wXBoRgixCa6xjnB7YaB1pPB263 --reward-duration 2592000 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool E1e519xoDRerXjv6PovC5gwievmTQREGVxxRhg2ZR4VB --funder 47sMzrVW41PYFvZX2ak1joFfC394gQmTuu5wGmbMyvBe
cargo run -- authorize --pool E1e519xoDRerXjv6PovC5gwievmTQREGVxxRhg2ZR4VB --funder 6JZoszTBzkGsskbheswiS6z2LRGckyFY4SpEGiLZqA9p
cargo run -- show-info --pool E1e519xoDRerXjv6PovC5gwievmTQREGVxxRhg2ZR4VB

11. Bonk-USDC

cargo run -- init --staking-mint 57XsTY7v5EL6TZdpA5vBtDT7VjBT81ty5iGaaMjq92Lo --reward-a-mint DezXAZ8z7PnrnRJjz3wXBoRgixCa6xjnB7YaB1pPB263 --reward-b-mint DezXAZ8z7PnrnRJjz3wXBoRgixCa6xjnB7YaB1pPB263 --reward-duration 2592000 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 8i8FuZQZ5NxpvVWz4nKtmP9MjnZxVCtibMhaAzSSFase --funder 
cargo run -- authorize --pool 8i8FuZQZ5NxpvVWz4nKtmP9MjnZxVCtibMhaAzSSFase --funder 6JZoszTBzkGsskbheswiS6z2LRGckyFY4SpEGiLZqA9p
cargo run -- show-info --pool 8i8FuZQZ5NxpvVWz4nKtmP9MjnZxVCtibMhaAzSSFase

12. bSOL-SOL
cargo run -- init --staking-mint 8ioaL3gTSAhNJy3t9JakXuoKobJvms62Ko5aWHvmHgSf --reward-a-mint bSo13r4TkiE4KumL71LsHTPpL2euBYLFx6h9HP3piy1 --reward-b-mint BLZEEuZUBVqFhj8adcCFPJvPVCiCyVmh3hkJMrU8KuJA --reward-duration 604800 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 4mNHArimvdk3FRQtKuycYQTnjZSyNvJFh9LCUmb2GEpz --funder 7zND8YAtCYehNoa1JrfDLQZi44xJkEuPWK5b4CkiuFpo
cargo run -- authorize --pool 4mNHArimvdk3FRQtKuycYQTnjZSyNvJFh9LCUmb2GEpz --funder HAUN8e5MAHrdajCgTo1rcW3NffooBQRqD1MXWXggdSRs


12. UXD-USDC 
cargo run -- init --staking-mint 36F4LM4tK5xSteQnv7DGjkgoyeb7iWjzwGwmxiEUixPC --reward-a-mint UXPhBoR3qG4UCiGNJfV7MqhHyFqKN68g45GoYvAeL2M --reward-b-mint UXPhBoR3qG4UCiGNJfV7MqhHyFqKN68g45GoYvAeL2M 2592000 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 2bos9UW2aDMtB6ReisD255vzDZBhFdwAntU1mmTrvYZP --funder 27tTqhSwT4ZUXRfA2gBM5XCRSyb5CS2Q7cv7w7amdfLA
cargo run -- show-info --pool 2bos9UW2aDMtB6ReisD255vzDZBhFdwAntU1mmTrvYZP


13. tbtc-usdc
cargo run -- init --staking-mint CGUny2zu4jLn2qrsMyMWn1xGaY7JRT5Vw7RKbWkXAcpG --reward-a-mint 4Njvi3928U3figEF5tf8xvjLC5GqUN33oe4XTJNe7xXC --reward-b-mint 4Njvi3928U3figEF5tf8xvjLC5GqUN33oe4XTJNe7xXC 2592000 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 8Jgm4GqS8QPBwcdJFyuqcNGpdVmfD1jPdkbmq1XZHKqJ --funder EBqw6ikpZunVjeKPTg13cGzTpqAE9V5DTuGL9As9dcVb
cargo run -- authorize --pool 8Jgm4GqS8QPBwcdJFyuqcNGpdVmfD1jPdkbmq1XZHKqJ --funder BULRqL3U2jPgwvz6HYCyBVq9BMtK94Y1Nz98KQop23aD
cargo run -- show-info --pool 8Jgm4GqS8QPBwcdJFyuqcNGpdVmfD1jPdkbmq1XZHKqJ

14. tbtc-sol
cargo run -- init --staking-mint 33idbozUporFXiGenrRE1q2jhSVr6xiaju1CETd3A6Me --reward-a-mint 4Njvi3928U3figEF5tf8xvjLC5GqUN33oe4XTJNe7xXC --reward-b-mint 4Njvi3928U3figEF5tf8xvjLC5GqUN33oe4XTJNe7xXC 2592000 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 12W3G7vAKRjxZN4m8YqzyomoxX2tUxbABQkq1zndBkYt --funder EBqw6ikpZunVjeKPTg13cGzTpqAE9V5DTuGL9As9dcVb
cargo run -- show-info --pool 12W3G7vAKRjxZN4m8YqzyomoxX2tUxbABQkq1zndBkYt


15. BLZE-bSOL
cargo run -- init --staking-mint 8wThZ2uE3adpub3ueVEmoP6k23rorUVNAFMrVfi56GWr --reward-a-mint BLZEEuZUBVqFhj8adcCFPJvPVCiCyVmh3hkJMrU8KuJA --reward-b-mint BLZEEuZUBVqFhj8adcCFPJvPVCiCyVmh3hkJMrU8KuJA 604800 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool Go46cbuNrinkaYufzf7SmdEmJ8aLhCi9mqNMix6oByae --funder 7zND8YAtCYehNoa1JrfDLQZi44xJkEuPWK5b4CkiuFpo
cargo run -- authorize --pool Go46cbuNrinkaYufzf7SmdEmJ8aLhCi9mqNMix6oByae --funder HAUN8e5MAHrdajCgTo1rcW3NffooBQRqD1MXWXggdSRs

16.SOL-BLZE
cargo run -- init --staking-mint 8NcfjGLSq6eriq2k6mMmW7yUhu7U5DuHatKVQFj1R139 --reward-a-mint BLZEEuZUBVqFhj8adcCFPJvPVCiCyVmh3hkJMrU8KuJA --reward-b-mint BLZEEuZUBVqFhj8adcCFPJvPVCiCyVmh3hkJMrU8KuJA 604800 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 7V9L4Sd7g8TEU4oJLMpzxC5gdcGAsThJaH3EPEqPZYfs --funder 7zND8YAtCYehNoa1JrfDLQZi44xJkEuPWK5b4CkiuFpo
cargo run -- authorize --pool 7V9L4Sd7g8TEU4oJLMpzxC5gdcGAsThJaH3EPEqPZYfs --funder HAUN8e5MAHrdajCgTo1rcW3NffooBQRqD1MXWXggdSRs

17. BLZE-USDC
cargo run -- init --staking-mint G8D85rzNCjDodE6YPwaskoo1yBnHiCWtEFGrVEVhHPcW --reward-a-mint BLZEEuZUBVqFhj8adcCFPJvPVCiCyVmh3hkJMrU8KuJA --reward-b-mint BLZEEuZUBVqFhj8adcCFPJvPVCiCyVmh3hkJMrU8KuJA 604800 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool HCy855FgVxTqmz3YoSJVQi3E9bnHj1EqdjBUMbfySpxf --funder 7zND8YAtCYehNoa1JrfDLQZi44xJkEuPWK5b4CkiuFpo
cargo run -- authorize --pool HCy855FgVxTqmz3YoSJVQi3E9bnHj1EqdjBUMbfySpxf --funder HAUN8e5MAHrdajCgTo1rcW3NffooBQRqD1MXWXggdSRs

18. SOLTO-USDC
cargo run -- init --staking-mint GH49e7PnZxeNBboCvW88NXnLfPAChEAxogQh3hwC6Rro --reward-a-mint BXcNdJga3kkmpvrVFy8LXWxGMfr6XZAUK4Mx1ANyV4Lk --reward-b-mint BXcNdJga3kkmpvrVFy8LXWxGMfr6XZAUK4Mx1ANyV4Lk 4838400 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 3gqXmsSeMLkDj6BX9MvmVD2SWcc2863HatcNWsEopuRw --funder GXTinXehnxfpjzJNCrUv2uQogfMpSATiW2t9dxkmhuBE


19. abBUSD-4pool
cargo run -- show-info --pool 9S15vE5nR7MJhzrPjBXJ3Kmph9WMDk7p4U4w4TtzeT2u
cargo run -- init --staking-mint 8d8CouP9qR1pk6nL9VKXcSbxswbH9vmDRUMBt4nhnADz --reward-a-mint a11bdAAuV8iB2fu7X6AxAvDTo1QZ8FXB3kk5eecdasp --reward-b-mint a11bdAAuV8iB2fu7X6AxAvDTo1QZ8FXB3kk5eecdasp 3628800 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool Ejv8hZbRRNQVx9j68fvWoKEXSxNUvo7cRCYGSaGjABMv --funder D7PY6TzZRiNJwcZKaQStjjpU3KcfP6kVhrV69wrrgUXG


19. Hades-sol
cargo run -- init --staking-mint 3GgCMTyddNhZd29rKLLfQ86wQcer1CcksEgvYpraF2UH --reward-a-mint BWXrrYFhT7bMHmNBFoQFWdsSgA3yXoAnMhDK6Fn1eSEn --reward-b-mint BWXrrYFhT7bMHmNBFoQFWdsSgA3yXoAnMhDK6Fn1eSEn 43200000 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- show-info --pool 9dVSZkuhicBrTcHxuV8DoAjfmsyEmxihshS8qZomRtiY
cargo run -- authorize --pool 9dVSZkuhicBrTcHxuV8DoAjfmsyEmxihshS8qZomRtiY --funder Fzx2MEY6fuwjoL1g4Mh5D6dcxp24HEcdZ1QsrVxE5sfs


20. MRC-USDC
cargo run -- init --staking-mint 6dxZabKcTXuFPAZ7hoTNsVBhyotYk4bzgrww87G9J7An --reward-a-mint 5HsZR8eG7QpQcN8Mnp8oFdENRkJMP9ZkcKhPSCKTJSWh --reward-b-mint 5HsZR8eG7QpQcN8Mnp8oFdENRkJMP9ZkcKhPSCKTJSWh 2592000 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 7JZShuYZwFkDTNgBbGX1JddeFCLyc4QYwJ9vPotrxSCq --funder CwF7jFFj3N1ivvF6hFE97QZhpK6uP4sapQUsoRCRWVyz

20. MRC-SOL
cargo run -- init --staking-mint Bu1inEh5ukivcuyjrBe7779SS9XhRVrzRBTPsa8i7kwL --reward-a-mint 5HsZR8eG7QpQcN8Mnp8oFdENRkJMP9ZkcKhPSCKTJSWh --reward-b-mint 5HsZR8eG7QpQcN8Mnp8oFdENRkJMP9ZkcKhPSCKTJSWh 2592000 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 29DQB5C97HgJg5EKQ2EtnvSk28sS93WkgmnaXErB7HtT --funder CwF7jFFj3N1ivvF6hFE97QZhpK6uP4sapQUsoRCRWVyz

21. DABLNS-USDC
cargo run -- init --staking-mint 2VBMd7hKPfaJQX8wzpUsDZViFKPM64HXYBvpTYU68K3M --reward-a-mint dab15vg2k8zGJPy4xM2DH2G2BY3khrqduXapzYAV3y8 --reward-b-mint dab15vg2k8zGJPy4xM2DH2G2BY3khrqduXapzYAV3y8 2419200 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 5YT1E9M2xfQGfgsPgLFkEUSPCSH5jumjg1EThgoDPdV4 --funder 5pWq7sYa5mDj2JE8UWQ38o6ZJJAoZLzTr8zSD5DR1wSf
cargo run -- authorize --pool 5YT1E9M2xfQGfgsPgLFkEUSPCSH5jumjg1EThgoDPdV4 --funder 64ehWQ8dTKa9A4WMhf6Wgs5KHjALq92L1c89e6Lk9z6d
cargo run -- authorize --pool 5YT1E9M2xfQGfgsPgLFkEUSPCSH5jumjg1EThgoDPdV4 --funder BULRqL3U2jPgwvz6HYCyBVq9BMtK94Y1Nz98KQop23aD

22. Elon-SOL
cargo run -- init --staking-mint 5aVVBFcZVe48MXhsLPjA69JPXfZYJ7Ky34VMGGGKCtZN --reward-a-mint 6nKUU36URHkewHg5GGGAgxs6szkE4VTioGUT5txQqJFU --reward-b-mint 6nKUU36URHkewHg5GGGAgxs6szkE4VTioGUT5txQqJFU 2592000 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool 9EtXNQ5Fe97w1rQvVuWr2tQHJ7wCfG6mRUVjACxQqiJN --funder Hw3VhWGQoi1tq9PSjFsVpamaK57pvgdWT9TgK2u14vY3

23. SLDN-bSOL
cargo run -- init --staking-mint 2LVnH7qvKaJTa2CAWaxghLx22K7ik3xoExTT5XBk7THh --reward-a-mint BLZEEuZUBVqFhj8adcCFPJvPVCiCyVmh3hkJMrU8KuJA --reward-b-mint BLZEEuZUBVqFhj8adcCFPJvPVCiCyVmh3hkJMrU8KuJA 604800 --base /Users/andrewnguyen/Documents/personal/solana/base_key/base_key.json
cargo run -- authorize --pool DmSagYoPrGvL7T5ubfKuqnTq9tPfHQmM1RFcignCFqns --funder HAUN8e5MAHrdajCgTo1rcW3NffooBQRqD1MXWXggdSRs



cargo run -- check-funder-all-pool --cluster https://mercurial.rpcpool.com/e1ae11b59df1dfe6cfaabca05d66


cargo run -- migrate-farming-rate --cluster https://mercurial.rpcpool.com/e1ae11b59df1dfe6cfaabca05d66