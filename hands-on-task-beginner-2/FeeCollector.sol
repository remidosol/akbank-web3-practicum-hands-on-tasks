// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FeeCollector {
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    receive() payable external {
        balance += msg.value;
    }

    modifier isOwner {
        require(msg.sender == owner, "Only owner can withdraw!");
        _;
    }

    modifier isBalanceSufficient(uint amount) {
        require(amount <= balance, "Insufficient funds!");
        _;
    }

    function withdraw(uint amount, address payable destAddr) public isOwner isBalanceSufficient(amount) {
        destAddr.transfer(amount);
        balance -= amount;
    }
}