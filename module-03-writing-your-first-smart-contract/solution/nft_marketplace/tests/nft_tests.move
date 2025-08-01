module nft_marketplace::tests;

use sui::test_scenario::{Self as ts};
use std::string;
use nft_marketplace::nft::{Self, NFT};

const MIKE: address = @0x1;
const BOB: address = @0x2;

#[test]
fun test_mint_nft() {
    let mut scenario = ts::begin(MIKE);

    nft::mint_nft(
        string::utf8(b"Test NFT"),
        string::utf8(b"A test NFT"),
        MIKE,
        ts::ctx(&mut scenario)
    );

    ts::next_tx(&mut scenario, MIKE);

    assert!(ts::has_most_recent_for_sender<NFT>(&scenario), 1);

    let nft = ts::take_from_sender<NFT>(&scenario);
    assert!(nft::get_nft_name(&nft) == string::utf8(b"Test NFT"), 1);
    assert!(nft::get_nft_description(&nft) == string::utf8(b"A test NFT"), 2);
    
    ts::return_to_sender(&scenario, nft);
    ts::end(scenario);
}

#[test]
fun test_transfer_nft() {
    let mut scenario = ts::begin(MIKE);

    // Mike mints an NFT
    nft::mint_nft(
        string::utf8(b"Transfer NFT"),
        string::utf8(b"NFT for transfer test"),
        MIKE,
        ts::ctx(&mut scenario)
    );

    // Mike takes the NFT and transfers it to Bob
    ts::next_tx(&mut scenario, MIKE);
    let nft = ts::take_from_sender<NFT>(&scenario);
    nft::transfer(nft, BOB);

    // Check that Bob received the NFT
    ts::next_tx(&mut scenario, BOB);
    assert!(ts::has_most_recent_for_sender<NFT>(&scenario), 0);

    let nft = ts::take_from_sender<NFT>(&scenario);
    assert!(nft::get_nft_name(&nft) == string::utf8(b"Transfer NFT"), 1);

    ts::return_to_sender(&scenario, nft);
    ts::end(scenario);
}