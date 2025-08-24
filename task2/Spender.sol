// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./ECoin.sol";

//授权合约
contract spenderContract{

    ECoin ecoin;
    //0x9326a36fec05C8e28f02a1Bc2CAa485875b69869
    constructor(address addr){
        ecoin = ECoin(addr);
    }

    //总共代币数
    function totalSupply() public view returns (uint256) {
        return ecoin.totalSupply();
    }
    //查询账户余额
    function balanceOf(address addr)public view returns(uint256){
        return ecoin.balanceOf(addr);
    }

    //转账（从调用者账户向目标账户转移代币）
    function transfer(address to, uint256 value) public returns(bool){
        return ecoin.transfer(to, value);
    }

    //授权第三方spender可以使用代币
    function approve(address spender, uint256 value) public returns (bool) {
        return ecoin.approve(spender, value);
    }

    //第三方（被授权者）代替 from 使用代币
    function transferFrom(address from, address to, uint256 value)public returns(bool){
        return ecoin.transferFrom(from, to, value);
    }

        //查询授权的额度
    function allowance(address from, address spender) public view returns(uint256){
        return ecoin.allowance(from, spender);
    }

    //增发代币
    function mint(address to,uint256 amount)public returns(bool){
        return ecoin.mint(to, amount);
    }

}

//当前合约
contract selfContract{

    ECoin ecoin;

    //0x9326a36fec05C8e28f02a1Bc2CAa485875b69869
    constructor(address addr){
        ecoin = ECoin(addr);
    }

    //总共代币数
    function totalSupply() public view returns (uint256) {
        return ecoin.totalSupply();
    }
    //查询账户余额
    function balanceOf(address addr)public view returns(uint256){
        return ecoin.balanceOf(addr);
    }

    //转账（从调用者账户向目标账户转移代币）
    function transfer(address to, uint256 value) public returns(bool){
        return ecoin.transfer(to, value);
    }

    //授权第三方spender可以使用代币
    function approve(address spender, uint256 value) public returns (bool) {
        return ecoin.approve(spender, value);
    }

    //第三方（被授权者）代替 from 使用代币
    function transferFrom(address from, address to, uint256 value)public returns(bool){
        return ecoin.transferFrom(from, to, value);
    }

        //查询授权的额度
    function allowance(address from, address spender) public view returns(uint256){
        return ecoin.allowance(from, spender);
    }

    //增发代币
    function mint(address to,uint256 amount)public returns(bool){
        return ecoin.mint(to, amount);
    }

}

//其他合约
contract otherContract{

    ECoin ecoin;

    //0x9326a36fec05C8e28f02a1Bc2CAa485875b69869
    constructor(address addr){
        ecoin = ECoin(addr);
    }

        //总共代币数
    function totalSupply() public view returns (uint256) {
        return ecoin.totalSupply();
    }
    //查询账户余额
    function balanceOf(address addr)public view returns(uint256){
        return ecoin.balanceOf(addr);
    }

    //转账（从调用者账户向目标账户转移代币）
    function transfer(address to, uint256 value) public returns(bool){
        return ecoin.transfer(to, value);
    }

    //授权第三方spender可以使用代币
    function approve(address spender, uint256 value) public returns (bool) {
        return ecoin.approve(spender, value);
    }

    //第三方（被授权者）代替 from 使用代币
    function transferFrom(address from, address to, uint256 value)public returns(bool){
        return ecoin.transferFrom(from, to, value);
    }

    //查询授权的额度
    function allowance(address from, address spender) public view returns(uint256){
        return ecoin.allowance(from, spender);
    }

    //增发代币
    function mint(address to,uint256 amount)public returns(bool){
        return ecoin.mint(to, amount);
    }

}