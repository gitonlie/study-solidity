// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract BinarySearch{                                  
    uint256[] public array = [11,12,13,14,15,16,17,18,19,20];

    function find(uint256 num)public view returns(uint256){
        uint256 start = 0;
        uint256 end = array.length-1;
        uint256 mid = 0;
        while(start<=end){
            mid = (start+end)/2;
            if(array[mid] == num){
                break;
            }else if(num < array[mid]){
                end = mid - 1;
            }else{
                start = mid + 1;
            }
        }
        return mid;
    }

}