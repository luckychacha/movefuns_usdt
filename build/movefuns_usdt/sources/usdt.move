module movefuns_usdt::usdt {
    use sui::tx_context::{TxContext, sender};
    use sui::coin;
    use sui::transfer;
    use sui::coin::TreasuryCap;

    struct USDT has drop {

    }

    fun init(witness: USDT, ctx: &mut TxContext) {
        // let usdt = USDT{};
        //
        //  let cap = coin::create_currency(
        //     usdt,
        //     9,
        //     ctx
        // );
        //
        // let address = sender(ctx);
        //
        // transfer::transfer(cap, address);
        //
        //
        transfer::transfer(
            coin::create_currency(
                witness,
                9,
                ctx
            ),
            sender(ctx)
        );
    }

    public entry fun mint_me(
        cap: &mut TreasuryCap<USDT>,
        amount: u64,
        ctx: &mut TxContext
    ) {
        let coin_usdt = coin::mint(cap, amount, ctx);
        transfer::transfer(coin_usdt, sender(ctx));
    }

    public entry fun mint_to(
        cap: &mut TreasuryCap<USDT>,
        amount: u64,
        to: address,
        ctx: &mut TxContext
    ) {
        let coin_usdt = coin::mint(cap, amount, ctx);
        transfer::transfer(coin_usdt, to);
    }
}