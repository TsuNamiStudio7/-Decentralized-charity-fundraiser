const Web3 = require('web3');
const web3 = new Web3(window.ethereum);
const contractAddress = '0xYourContractAddressHere';
const abi = [PASTE_YOUR_ABI_HERE];

const contract = new web3.eth.Contract(abi, contractAddress);

async function startCampaign() {
    const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
    const account = accounts[0];

    const result = await contract.methods.startCampaign().send({ from: account });
    console.log(result);
}

async function donate(amount) {
    const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
    const account = accounts[0];

    const result = await contract.methods.donate().send({ from: account, value: web3.utils.toWei(amount, 'ether') });
    console.log(result);
}

async function getCampaignStatus() {
    const status = await contract.methods.getCampaignStatus().call();
    console.log(`Campaign: ${status[0]} Raised: ${web3.utils.fromWei(status[1], 'ether')} Ether Target: ${web3.utils.fromWei(status[2], 'ether')} Ether Active: ${status[3]}`);
}

document.getElementById('startCampaign').addEventListener('click', startCampaign);
document.getElementById('donate').addEventListener('click', function() {
    const amount = document.getElementById('donationAmount').value;
    donate(amount);
});
document.getElementById('getStatus').addEventListener('click', getCampaignStatus);
