module localnftmint::localnftmint;

use std::string::{Self, String};
use sui::url::{Self, Url};


public struct LocalNFT has key, store {
    id: UID,
    name: String,
    description: String,
    image_url: Url,
}

#[allow(lint(self_transfer))]
public fun mint_nft(name: vector<u8>, description: vector<u8>, image_url: vector<u8>, ctx: &mut TxContext) {
    let sender = ctx.sender();
    let nft = LocalNFT {
        id: object::new(ctx),
        name: string::utf8(name),
        description: string::utf8(description),
        image_url: url::new_unsafe_from_bytes(image_url),
    };

    transfer::transfer(nft, sender)

}