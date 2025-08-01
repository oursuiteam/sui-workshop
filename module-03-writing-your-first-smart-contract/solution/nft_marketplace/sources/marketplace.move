module nft_marketplace::marketplace;

use sui::table::{Self, Table};
use sui::coin::{Self, Coin};
use sui::sui::SUI;
use nft_marketplace::nft::NFT;

const EListingNotFound: u64 = 1;
const ESelfPurchase: u64 = 2;
const EInsufficientPayment: u64 = 3;
const ENotSeller: u64 = 4;

public struct Marketplace has key {
    id: UID,
    listings: Table<address, Listing>,
}

public struct Listing has store {
    price: u64,
    nft: NFT,
    seller: address,
}

public fun create_marketplace(ctx: &mut TxContext): Marketplace {
    Marketplace {
        id: object::new(ctx),
        listings: table::new(ctx),
    }
}

public fun list_nft(marketplace: &mut Marketplace, nft: NFT, price: u64, ctx: &mut TxContext) {
    let seller = tx_context::sender(ctx);
    let nft_id = object::borrow_id(&nft).to_address();

    let listing = Listing {
        price,
        nft, 
        seller,
    };

    table::add(&mut marketplace.listings, nft_id, listing);
}

#[allow(lint(self_transfer))]
public fun purchase_nft(marketplace: &mut Marketplace, nft_id: address, payment: Coin<SUI>, ctx: &mut TxContext) {
    assert!(table::contains(&marketplace.listings, nft_id), EListingNotFound);

    let buyer = tx_context::sender(ctx);
    let listing = table::remove(&mut marketplace.listings, nft_id);

    assert!(listing.seller != buyer, ESelfPurchase);
    assert!(coin::value(&payment) >= listing.price, EInsufficientPayment);

    // Transfer payment to seller
    transfer::public_transfer(payment, listing.seller);

    // Transfer NFT to buyer
    let Listing {nft, price: _, seller: _} = listing;

    transfer::public_transfer(nft, buyer);
}

public fun cancel_listing(marketplace: &mut Marketplace, nft_id: address, ctx: &mut TxContext) {
    assert!(table::contains(&marketplace.listings, nft_id), EListingNotFound);

    let listing = table::borrow(&marketplace.listings, nft_id);
    assert!(listing.seller == tx_context::sender(ctx), ENotSeller);

    let listing = table::remove(&mut marketplace.listings, nft_id);
    let Listing {nft, price: _, seller} = listing;

    transfer::public_transfer(nft, seller);
}

// ===== Getters =====
public fun is_listed(marketplace: &Marketplace, nft_id: address): bool {
    table::contains(&marketplace.listings, nft_id)
}

public fun get_listing_price(marketplace: &Marketplace, nft_id: address): u64 {
    assert!(table::contains(&marketplace.listings, nft_id), EListingNotFound);
    table::borrow(&marketplace.listings, nft_id).price
}