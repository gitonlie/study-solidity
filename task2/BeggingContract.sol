// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

//讨饭合约 0xd14FB10dFA4351eC902405c7AD56f54C65d22bD7
contract BeggingContract {

    mapping (address addr=>uint256 amount) public records;
    address public owner;
    
     // 捐赠排行榜数据结构
    struct Donor {
        address addr;
        uint256 amount;
    }
    
    Donor[3] public topDonors; // 存储前三名捐赠者
    // 捐赠时间段限制
    uint256 public donationStartTime;
    uint256 public donationEndTime;

    constructor(){
        owner = msg.sender;
        donationStartTime = block.timestamp; // 设置捐赠开始时间
        donationEndTime = donationStartTime + 24 * 60 * 60; //限制合约部署的24小时内可捐赠
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can withdraw funds.");
        _;
    }

    modifier timeLimit {
        // 检查是否在捐赠时间内
        require(block.timestamp >= donationStartTime && block.timestamp <= donationEndTime, "Donations are only accepted during the specified period.");
        _;
    }

    event Donation(address donateAddr, uint256 amount);

    //捐赠金额
    function donate() external payable timeLimit{
        address donateAddr = msg.sender;
        uint256 amount = msg.value;
        //记录捐赠者
        records[donateAddr]+=amount;
        //更新排行榜
        updateRank(donateAddr, amount);

        emit Donation(donateAddr, amount);
    }

    //查询某个地址的捐赠金额
    function getDonation(address addr) external view returns (uint256) {
        return records[addr];
    }

    //提现资金
    function withdraw() external onlyOwner {
        uint256 _totalDonations = address(this).balance;
        payable(msg.sender).transfer(_totalDonations);
    }

    //捐赠排行榜
    function getDonorRank() external view returns(Donor[3] memory){
        return topDonors;
    }

    //重新排位
    function updateRank(address donateAddr, uint256 amount)internal {
        if (amount > topDonors[0].amount) {
            topDonors[2] = topDonors[1];
            topDonors[1] = topDonors[0];
            topDonors[0] = Donor(donateAddr, amount);
        } else if (amount > topDonors[1].amount) {
            topDonors[2] = topDonors[1];
            topDonors[1] = Donor(donateAddr, amount);
        } else if (amount > topDonors[2].amount){
            topDonors[2] = Donor(donateAddr, amount);
        }
    }
}