////SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0; // version but not the latest(0.8.12)

//Inheritance

import "./SimpleStorage.sol";
contract ExtraStorage is SimpleStorage {
    // + 5
    // override the store function
    //virtual override
    
    function store(uint256 _favouriteNumber) public override {
        favouriteNumber = _favouriteNumber + 5;


    }

}