// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CharityFundraiser {
    address public owner;
    uint256 public targetAmount;
    uint256 public raisedAmount;
    string public campaignName;
    string public campaignDescription;
    bool public campaignActive;

    mapping(address => uint256) public donations;

    event DonationReceived(address donor, uint256 amount);
    event CampaignStarted(string campaignName, uint256 targetAmount);
    event CampaignCompleted(string campaignName, uint256 totalAmountRaised);

    constructor(string memory _campaignName, string memory _campaignDescription, uint256 _targetAmount) {
        owner = msg.sender;
        campaignName = _campaignName;
        campaignDescription = _campaignDescription;
        targetAmount = _targetAmount;
        campaignActive = false;
        raisedAmount = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    modifier campaignIsActive() {
        require(campaignActive, "Campaign is not active");
        _;
    }

    function startCampaign() public onlyOwner {
        campaignActive = true;
        emit CampaignStarted(campaignName, targetAmount);
    }

    function donate() public payable campaignIsActive {
        require(msg.value > 0, "Donation must be greater than zero");
        donations[msg.sender] += msg.value;
        raisedAmount += msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }

    function endCampaign() public onlyOwner {
        require(campaignActive, "Campaign is not active");
        require(raisedAmount >= targetAmount, "Target not reached");

        campaignActive = false;
        payable(owner).transfer(raisedAmount);

        emit CampaignCompleted(campaignName, raisedAmount);
    }

    function getCampaignStatus() public view returns (string memory, uint256, uint256, bool) {
        return (campaignName, raisedAmount, targetAmount, campaignActive);
    }
}
