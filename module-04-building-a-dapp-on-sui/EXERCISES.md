# Exercises

## 1. NFT Minting App

### Backend

* Write Move code to define an `NFT` struct with:

  * `key` ability
  * `store` ability
  * Metadata fields (e.g. name, description, image URL)

* Implement a minting function:

  * Creates an NFT
  * Transfers it to the transaction sender

### Front-End

* Use the Sui TypeScript SDK or dApp Kit to:

  * Connect wallet
  * Trigger the mint function with metadata
  * Display the NFT after minting

---

## 2. Building a Basic DeFi App

### Backend

* Write a smart contract to define a **Lending Pool** struct
* Implement the following functions:

  * `deposit()`: For users to deposit SUI
  * `borrow()`: Borrow against collateral
  * `repay()`: Repay borrowed amounts
  * Include interest logic if possible, maybe a 5% interest on every loan taken.

### Front-End

* Pages:

  * Deposit Page
  * Borrow Page
  * Repay Loan Page

* Use the SDK to:

  * Connect wallet
  * Call deposit, borrow, and repay functions using movecall()
  * Manage UI state and feedback
