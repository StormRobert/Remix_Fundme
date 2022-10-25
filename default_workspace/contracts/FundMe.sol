// Get funds from users
// withdraw funds
//set a min funding value

///SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0; // version but not the latest(0.8.12)

import "./PriceConverter.sol";



contract FundMe {
    using PriceConverter for uint256;
    
    uint256 public constant MINIMUM_USD = 50 * 1e18;// 1*10**18
    //21,415 gas fee- constant
    //23,515 gas fee- non-constant

     address[] public funders;// array for funders
     mapping(address => uint256) public addressToAmountFunded;
    
    address public immutable i_owner;
    //21,508 gas fee - immutable
    //23,644 gas fee - non-immutable

    constructor () {
        i_owner = msg.sender;

    }

    function fund() public payable{
       // msg.value.getConversionRate();
        //set min.amount in USD
        //Sending Ethers to this Contract
        //funders sending ethers to our address
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't Send enough!");  // 18 decimals(wei)
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
        

    }

    function withdraw() public onlyOwner{
       // for loop  // array [1, 2, 3, 4]
                    //        0, 1, 2, 3 // /* starting index, ending index, step amount*/
       for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex = funderIndex + 1) { 
           //for loop will update by 1 from 0 then check if the funder index is less than the funders length(i.e 10 pple and the index is 1 the funder index will equal to the funders contributing in the address Funder)
           address funder = funders[funderIndex];
           addressToAmountFunded[funder] = 0; // initial address to be funded is 0

       }
       // reset array
       funders = new address[](0);
       //actually withdraw funds
       
       //call function (2 functions are being called) since bytes are arrays they are stored in memory
       (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
       require(callSuccess, "Send Failed!!");


    }

    modifier onlyOwner {
        require(msg.sender == i_owner, "Sender isn't owner!!");
     
        _ ; //means that the require is done first b4 the function withdraw fully takes place
    }

    receive() external payable {
        fund();
    }
    
     
    fallback() external payable {
        fund(); 
    }
}