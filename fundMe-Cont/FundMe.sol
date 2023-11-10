// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract FundMe{

    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;

    address public /* immutable */ i_owner;
    uint256 public constant MINIMUM_USD = 5 * 10 ** 18;
    
    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value >= MINIMUM_USD, "You need to spend more ETH!");
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    

    function withdraw() public {}
}