from web3 import Web3
import json

# Setup connection to Ethereum (Rinkeby test network in this example)
w3 = Web3(Web3.HTTPProvider("https://rinkeby.infura.io/v3/YOUR_INFURA_PROJECT_ID"))

# Set the contract ABI and address
contract_address = '0xYourContractAddressHere'
abi = json.loads('[PASTE_YOUR_ABI_HERE]')

# Initialize contract instance
contract = w3.eth.contract(address=contract_address, abi=abi)

# Define the account sending donations (replace with your private key)
private_key = "your_private_key_here"
account = w3.eth.account.privateKeyToAccount(private_key)
address = account.address

def donate(amount_in_ether):
    nonce = w3.eth.getTransactionCount(address)
    transaction = contract.functions.donate().buildTransaction({
        'chainId': 4,  # Rinkeby testnet
        'gas': 2000000,
        'gasPrice': w3.toWei('20', 'gwei'),
        'nonce': nonce,
        'value': w3.toWei(amount_in_ether, 'ether')
    })

    signed_txn = w3.eth.account.signTransaction(transaction, private_key)
    txn_hash = w3.eth.sendRawTransaction(signed_txn.rawTransaction)

    print(f"Donation successful! Transaction hash: {txn_hash.hex()}")

def get_campaign_status():
    status = contract.functions.getCampaignStatus().call()
    print(f"Campaign: {status[0]}\nRaised: {status[1]} Ether\nTarget: {status[2]} Ether\nActive: {status[3]}")

# Example usage
get_campaign_status()
donate(0.1)  # Donating 0.1 Ether to the campaign
