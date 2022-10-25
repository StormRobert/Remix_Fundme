///SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract SafeMathTester {
    uint8 public bigNumber = 255; //unchecked 

    function add() public {
        unchecked {bigNumber = bigNumber + 1;} //starts from the lowest integer
        

    }
}