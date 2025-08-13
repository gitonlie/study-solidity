// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ReverseString{

    function reverseStr(string memory str) public pure returns(string memory){
        bytes memory bstr = bytes(str);
        uint256 len = bstr.length;
        if(len<=1){
            return str;
        }

        uint256 start = 0;
        uint256 end = len - 1;
        while (start<end){
           (bstr[start],bstr[end]) = ( bstr[end],bstr[start]);
           start++;
           end--;
        }

        return string(bstr);
    }
}