// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

//ERC20 address 0x9326a36fec05C8e28f02a1Bc2CAa485875b69869
contract ECoin{
    event Transfer(address from,address to, uint256 amount);
    event Approval(address owner,address spender, uint256 amount);

    mapping (address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowances;
    uint256 private _totalSupply;

    //总共代币数
    function totalSupply() public view virtual returns (uint256) {
        return _totalSupply;
    }
    //查询账户余额
    function balanceOf(address addr)public view virtual returns(uint256){
        return balances[addr];
    }

    //转账（从调用者账户向目标账户转移代币）
    function transfer(address to, uint256 value) public virtual returns(bool){
        address from = msg.sender;
        //更改代币逻辑
        transferCoin(from, to, value);
        return true;
    }

    //授权第三方spender可以使用代币
    function approve(address spender, uint256 value) public virtual returns (bool) {
        address owner = msg.sender;
        //设置授权额度
        allowances[owner][spender] = value;
        emit Approval(owner, spender, value);
        return true;
    }

    //第三方（被授权者）代替 from 使用代币
    function transferFrom(address from, address to, uint256 value)public virtual returns(bool){
        address spender = msg.sender;
        uint256 currentAllowance = allowances[from][spender];
        if (currentAllowance < value) {
                revert("Insufficient authorization limit");
        }
        //修改授权额度
        allowances[from][spender] = currentAllowance - value;
        //更改代币逻辑
        transferCoin(from, to, value);
        return true;
    }

    //查询授权的额度
    function allowance(address from, address spender) public view virtual returns(uint256){
        return allowances[from][spender];
    }

    //增发代币
    function mint(address to,uint256 amount)public virtual returns(bool){
        balances[to]+=amount;
        _totalSupply+=amount;
        return true;
    }


    //内部实现数据转移
    function transferCoin(address from, address to, uint256 value) internal {
            uint256 fromBalance = balances[from];
            if (fromBalance < value) {
                revert("Insufficient balance");
            }
            balances[from] = fromBalance - value;
            balances[to] += value;
            emit Transfer(from, to, value);
    }

}