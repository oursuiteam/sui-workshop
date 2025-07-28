# Exercises

## 1. zkLogin Integration

### Objective:

Integrate zkLogin into your dApp using Google authentication.

### Task:

* Complete the `login.ts` handler
* Use:

  * `@googleapis/oauth2` to authenticate with Google
  * `@sui/sui.js`’s `generateZkProof()` helper to create the zkProof

### Complete the Function:

```ts
// login.ts
export async function login(req: Request, res: Response) {
  const { idToken } = req.body;

  // 1. Verify the token with Google's OAuth2 API
  // 2. Generate zkLogin proof using @sui/sui.js
  // 3. Return zkProof or authenticate user into the dApp
}
```

**Reference:** [zkLogin Example](https://docs.sui.io/guides/developer/cryptography/zklogin-integration/zklogin-example)

---

## 2. Sponsor Your First Transaction

### Objective:

Set up and use Sponsored Transactions to manage gas fees for your dApp.

### Task:

* Set up a **Gas Sponsor** (e.g. Shinami Gas Station)
* Create a transaction where the user pays zero gas
* Submit the transaction through a sponsored flow

### Tips:

* You'll need a sponsor account with enough gas to pay on behalf of users.
* Use `requestSponsorship()` (or equivalent from Shinami SDK) before submitting the transaction.
* Track gas cost metrics to measure effectiveness.

**Reference:** [Shinami Gas Station Tutorial](https://blog.sui.io/shinami-gas-station-tutorial/)

---

## 3. On-Chain Price Feed

### Objective:

Use Oracles to fetch off-chain data and submit it on-chain.

### Task:

* Make a POST request to:
  `http://localhost:8080/price?symbol=ETH/USD`
* Parse the JSON response in your Node.js script
* Call the Move smart contract’s `submit_price()` function

### Tips:

* Use `node-fetch` or `axios` to make HTTP requests in Node.js.
* Format your JSON so that the Sui smart contract can read and parse it as expected.
* Ensure you handle decimal precision consistently across Node and Move.

**Reference:**

* [Weather Oracle Example](https://docs.sui.io/guides/developer/app-examples/weather-oracle#initialize-the-project)
* [Move Oracles GitHub](https://github.com/pentagonxyz/move-oracles)

---

## 4. Building a Simple AI Agent

### Objective:

Use the SUI AI Agent Kit to build an agent that interacts with the blockchain.

### Task:

* Track wallet balance using the AI agent
* Interact with DeFi protocols via the agent
* Use:

  * `@flowx-finance/sdk`
  * Nimbus AI Agent kit

**Reference:**

* [SUI AI Agent Docs](https://docs.getnimbus.io/sui-ai-agent/introduction)
* [Agent SDK (npm)](https://www.npmjs.com/package/@flowx-finance/sdk)
