module pool::lending_pool;

use sui::coin::{Self, Coin};
use sui::balance::{Self, Balance};
use sui::table::{Self, Table};

public struct Pool<phantom T> has key {
  id: UID,
  deposits: Table<address, u64>,
  loan: Table<address, Loan>,
  total_borrowed: u64,
  total_deposits: Balance<T>,
}

public struct Loan has store {
  value: u64,
  timestamp: u64
}

public fun create_pool<T>(ctx: &mut TxContext): Pool<T> {
  let id = object::new(ctx);
  let deposits = table::new(ctx);
  let loan = table::new(ctx);
  let total_borrowed = 0;
  let total_deposits = balance::zero();

  Pool {
    id,
    deposits,
    loan,
    total_borrowed,
    total_deposits
  }
}

public fun deposit<T>(_pool: &mut Pool<T>, _coin: Coin<T>, _ctx: &mut TxContext){
  let value = coin::value(&_coin);
  let depositor = tx_context::sender(_ctx);

  balance::join(&mut _pool.total_deposits, coin::into_balance(_coin));

  if (table::contains(&_pool.deposits, depositor)) {
    let current_balance = table::remove(&mut _pool.deposits, depositor);
    table::add(&mut _pool.deposits, depositor, current_balance + value)
  } else {
    table::add(&mut _pool.deposits, depositor, value);
  };
}

// public fun borrow<T>(_pool: &mut Pool<T>, _amount: u64, _clock: &Clock, _ctx: &mut TxContext)

// public repay<T>(_pool: &mut Pool<T>, _coin: Coin<T>, _clock: &Clock, _ctx: &mut TxContext)

// fun calculate_loan_interest(loans: &Table<address, Loan>, user: address,clock: &Clock): u64