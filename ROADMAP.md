# ROADMAP: Become a Sui Move Developer

Welcome! This roadmap is your step-by-step guide to mastering **Sui Move** — the smart contract language used on the Sui blockchain. We begin with foundational blockchain concepts, and gradually build toward full-stack decentralized application (dApp) development on Sui.

> All concepts are aligned with [Sui Docs](https://docs.sui.io), [The Move Book](https://move-book.com), and the [Sui Foundation’s Intro Course](https://github.com/sui-foundation/sui-move-intro-course).

---

## Beginner Level: Blockchain & Move Foundations

### 1. Blockchain Basics (Web3 101)

Learn the fundamentals of how blockchains work.

Topics:

* What is a blockchain?
* Smart contracts vs traditional backend
* Consensus, tokens, transactions, gas
* Public/private keys and wallets

Resources:

* [YouTube: Simply Explained – What is Blockchain?](https://www.youtube.com/watch?v=SSo_EIwHSd4)

---

### 2. Introduction to Move Language

Before jumping into Sui Move, learn core Move syntax.

Topics:

* Packages, modules, functions
* Structs, resources, types
* Linear types and ownership
* Abilities: `copy`, `drop`, `store`, `key`

Resources:

* [The Move Book (Ch. 1–4)](https://move-book.com/)


---

### 3. Setting Up Your Sui Environment

Get your tools ready to work with Sui Move.

Tasks:

* Install Sui CLI & Devnet
* Create and build your first Move package
* Publish a package on Devnet

Resources:


* [Sui CLI Setup Guide](https://docs.sui.io/guides/developer/getting-started/sui-install)
* [YouTube: Sui Setup & Hello World](https://www.youtube.com/watch?v=Em61XUDuApQ)

---

## 🟡 Intermediate Level: Sui Move in Practice

### 4. Sui Move Core Concepts

Learn what makes Sui Move different from other Move-based chains.

📌 Topics:

* Object-centric model (Owned, Shared, Immutable)
* UIDs and object IDs
* Entry functions and visibility
* Modules & capabilities (e.g., minting, transferring)

Resources:

* [Sui Move Concepts](https://docs.sui.io/concepts/sui-move-concepts)
* [The Move Book - Ch. 5: Objects and Resources](https://move-book.com/)
* [YouTube: Introduction to Sui and Move](https://www.youtube.com/watch?v=-VpZOtkMXcg)

---

### 5. Building Smart Contracts on Sui

Create and deploy meaningful Sui Move modules.

Tasks:

* Build reusable modules (Coin, NFT, Marketplace)
* Use `entry` functions to create and mutate objects
* Use events and view functions

Resources:

* [Sui Move Intro Course – Unit 2 & 3](https://github.com/sui-foundation/sui-move-intro-course)
* [The Move Book - Modules, Structs, Visibility](https://move-book.com)
* [YouTube: Write Your First Smart Contract on Sui](https://www.youtube.com/watch?v=FBJjgZiia6g)

---

### 6. Programmable Transaction Blocks (PTBs)

Understand how multi-step transactions work in Sui.

Topics:

* MoveCall, SplitCoins, TransferObjects
* PTBs vs regular transactions
* Composing multiple operations in a single TX

Resources:

* [Sui Docs – PTBs](https://docs.sui.io/guides/developer/sui-101/building-ptb)
* [Sui Move Intro Course – Unit 5](https://github.com/sui-foundation/sui-move-intro-course)

---

## Advanced Level: Production-Grade Development

### 7. Advanced Patterns in Sui Move

Explore deeper design and security techniques.

Topics:

* Capability-based access control
* Witness/wrapping patterns
* Kiosk system and transfer policies
* Module initializers and dynamic fields

Resources:

* [The Move Book - Ch. 6–8](https://move-book.com/)
* [Sui Move Intro Course – Unit 4 & 5](https://github.com/sui-foundation/sui-move-intro-course)

---

### 8. Full-Stack Integration (Frontend + Move)

Use your contracts inside real dApps.

Topics:

* Integrate Move modules with TypeScript (Sui.js)

Resources:

* [Building Fullstack Counter dApps on Sui](https://docs.sui.io/guides/developer/app-examples/e2e-counter)

---

## Summary of Skills You’ll Build

| Skill Area           | Examples                               |
| -------------------- | -------------------------------------- |
| Smart Contracts      | Custom coins, NFTs, access control     |
| Transaction Design   | PTBs, gas optimization, shared objects |
| Testing & Safety     | Unit tests, formal verification        |
| Frontend Integration | Wallets, Sui.js, gasless TXs           |
| Deployment & Ops     | Publish, upgrade, analyze gas usage    |

---

## Useful Links Collection

| Resource                                                                                                        | Description                                |
| --------------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| [The Move Book](https://move-book.com/)                                                                      | Learn the Move language from scratch       |
| [Sui Documentation](https://docs.sui.io/)                                                                    | Full docs on CLI, Move, and development    |
| [Sui Move Intro Course](https://github.com/sui-foundation/sui-move-intro-course)                             | Hands-on GitHub curriculum with units      |
| [YouTube: Sui Dev Playlist](https://www.youtube.com/playlist?list=PLJm5g76LAUuree2ABqs8REUxEFCvfor0T)        | Tutorials from Encode Club & Sui           |
| [Sui Discord](https://discord.gg/sui)                                                                        | Ask questions, join dev chats              


