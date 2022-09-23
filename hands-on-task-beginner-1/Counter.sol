// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
* @contract Counter
* 
* @description Created for simulating a counter on blockchain
*/
contract Counter {
    uint public count;

    function increase() external {
        count++;
    }

    function decrease() external {
        count--;
    }
}