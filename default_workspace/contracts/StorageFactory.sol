//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0; // version but not the latest(0.8.12)

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

     function createSimpleStorageContract() public {
         SimpleStorage simpleStorage = new SimpleStorage();
         simpleStorageArray.push(simpleStorage);


     }
     
     function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
         //Address and ABI - Application Binary Interface
         simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
         
     }

     function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        return simpleStorageArray[_simpleStorageIndex].retrieve();
        

     }
}