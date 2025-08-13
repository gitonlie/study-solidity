// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract MergeArray{

    function merge(uint256[] memory a, uint256[] memory b)public pure returns(uint256[] memory){
        uint256 len1 = a.length;
        uint256 len2 = b.length;

        uint256[] memory merged = new uint256[](len1 + len2);
        
        uint256 i = 0;
        uint256 j = 0;
        uint256 k = 0;

        while (i < len1 && j < len2) {
            if (a[i] < b[j]) {
                merged[k] = a[i];
                i++;
            } else {
                merged[k] = b[j];
                j++;
            }
            k++;
        }

        while (i < len1) {
            merged[k] = a[i];
            i++;
            k++;
        }
        
        while (j < len2) {
            merged[k] = b[j];
            j++;
            k++;
        }

        return merged;
    }
}