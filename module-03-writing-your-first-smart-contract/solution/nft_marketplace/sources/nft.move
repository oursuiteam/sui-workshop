module nft_marketplace::nft;

use std::string::{Self, String};

const ENameTooLong: u64 = 1;
const EDescriptionTooLong: u64 = 2;
const EEmptyName: u64 = 3;

const MAX_NAME_LENGTH: u64 = 64;
const MAX_DESCRIPTION_LENGTH: u64 = 512;

public struct NFT has key, store {
    id: UID,
    name: String,
    description: String,
}


public fun mint_nft(name: String, description: String, recipient: address, ctx: &mut TxContext) {
    assert!(string::length(&name) > 0, EEmptyName);
    assert!(string::length(&name) <= MAX_NAME_LENGTH, ENameTooLong);
    assert!(string::length(&description) <= MAX_DESCRIPTION_LENGTH, EDescriptionTooLong); 

    let nft = NFT {
        id: object::new(ctx),
        name: name,
        description: description,
    };

    transfer::transfer(nft, recipient)
}

public fun transfer(nft: NFT, recipient: address) {
    transfer::public_transfer(nft, recipient)
}


// ====== Getters ======
public fun get_nft_name(nft: &NFT): String {
    nft.name
}

public fun get_nft_description(nft: &NFT): String {
    nft.description
}