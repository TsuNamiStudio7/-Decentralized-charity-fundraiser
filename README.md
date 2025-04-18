# 🌟 Decentralized Charity Fundraiser 🌟

Welcome to the **Decentralized Charity Fundraiser** platform! 🚀

This project leverages the power of blockchain to create transparent, immutable fundraising campaigns where donors can contribute to causes they care about. Campaign owners can easily track the progress of their fundraising efforts, and all donations are securely recorded on the Ethereum blockchain for maximum trust and transparency. 🔒

---

## 🚀 Key Features:

- **Create Fundraising Campaigns** 📝  
  Easily organize and launch charity campaigns with target goals and timelines.

- **Transparent Donations** 💸  
  Donors can contribute any amount, and every donation is publicly tracked on the blockchain for full transparency.

- **Track Progress** 📊  
  Real-time updates on the status of the fundraiser, including the total funds raised and remaining target.

- **Immutable Records** 🏛️  
  All transactions and updates are stored on the Ethereum blockchain, making the data tamper-proof.

---

## ⚙️ How It Works:

1. **Smart Contract**:  
   - The `CharityFundraiser.sol` contract is deployed on the Ethereum network.  
   - It supports creating campaigns, accepting donations, and tracking fund progress. Once the target is met, the funds are released to the campaign owner.

2. **Backend (Python)**:  
   - The Python script (`app.py`) interacts with Ethereum using **Web3.py**.  
   - It processes donations and tracks campaign progress by calling functions on the smart contract.

3. **Frontend (JavaScript)**:  
   - The `web3.js` script allows users to interact with the smart contract via a web interface.  
   - Donors can make contributions, check campaign progress, and see their donation history.

---

## 🛠️ Setup Instructions:

### 1. **Install Dependencies:**

- **Backend (Python)**:
  - Install **Web3** for interacting with the Ethereum blockchain:
  ```bash
  pip install web3
