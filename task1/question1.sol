// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Voting{
    mapping (address account=>uint256 count) public ticket;

    address[] accounts;
    mapping(address account=>bool exists) public existsMap;
    //投票
    function vote(address addr) public {
        ticket[addr] += 1;
        if(!existsMap[addr]){
            accounts.push(addr);
            existsMap[addr] = true;
        }
    }

    //获取得票数
    function getVotes(address addr) public view returns(uint256){
        return ticket[addr];
    }

    //重置所有候选人的得票数
    function resetVotes() public {
        for(uint256 i=0;i<accounts.length;i++){
            delete ticket[accounts[i]];
        }
    }
}