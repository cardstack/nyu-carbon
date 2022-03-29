// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract testBurn{
    address owner;
    uint256 value;
    uint256 balance;

    

    constructor() {
        owner = msg.sender;
    }

    // receive amount of token from the caller
    function receiveFund() public payable {
        balance += msg.value;
    }

    // get current balance in the contract
    function getBalance() public view returns(uint256) {
        return balance;
    }


    // burn all balance in the contract
    function burn() public payable {
        address payable _to = payable(address(0));
        _to.transfer(getBalance());
        balance = address(this).balance;
    }

}
