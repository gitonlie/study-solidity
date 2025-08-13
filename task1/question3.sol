// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract romanNumber{
    string[10] public digit_one = ["","I","II","III","IV","V","VI","VII","VIII","IX"];
    string[10] public digit_ten = ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"];
    string[10] public digit_hundred = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"];
    string[4] public digit_thousand = ["","M","MM","MMM"];


    function numToRoman(uint256 number) public view returns(string memory){
        require(number > 0 && number < 4000, "Number must be between 1 and 3999");
        return string.concat(digit_thousand[number/1000],digit_hundred[number/100%10],digit_ten[number/10%10],digit_one[number%10]);
    }

    mapping (string=> uint256) public symbol;
    constructor(){
        symbol['I']=1;
        symbol['V']=5;
        symbol['X']=10;
        symbol['L']=50;
        symbol['C']=100;
        symbol['D']=500;
        symbol['M']=1000;
    }

    function romanToNum(string memory roman) public view returns (uint256) {
        bytes memory b = bytes(roman);
        uint256 sum = 0;
        uint256 len = b.length;
        for (uint256 i = 0; i < len; i++) {
            uint256 value = symbol[bytes1ToString(b[i])];
            if (i < len - 1 && value < symbol[bytes1ToString(b[i+1])]) {
                sum -= value;
            } else {
                sum += value;
            }
        }
        return sum;
    }


    function bytes1ToString(bytes1 b) public pure returns (string memory) {
        bytes memory buffer = new bytes(1);
        buffer[0] = b;
        return string(buffer);
    } 

}