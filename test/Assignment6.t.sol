// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Assignment6} from "../src/Assignment6.sol";

contract Assignment6Test is Test {
    Assignment6 assignment;

    // This function sets up the contract instance
    function setUp() public {
        assignment = new Assignment6();
    }

    // Test deposit functionality
    function testDeposit() public {
        vm.deal(address(this), 1 ether); // Deal 1 ether to this contract
        assignment.deposit{value: 1 ether}(); // Deposit 1 ether
        uint balance = assignment.balances(address(this)); // Get balance for this address
        assertEq(balance, 1 ether, "Balance should be 1 ether"); // Assert balance is correct
    }

    // Test withdraw functionality
    function testWithdraw() public {
        vm.deal(address(this), 1 ether); // Deal 1 ether to this contract
        assignment.deposit{value: 1 ether}(); // Deposit 1 ether
        assignment.withdraw(0.5 ether); // Withdraw 0.5 ether
        uint balance = assignment.balances(address(this)); // Get balance for this address
        assertEq(balance, 0.5 ether, "Balance should be 0.5 ether after withdrawal"); // Assert balance is correct
    }

    // Test the contract's balance
    function testContractBalance() public {
        vm.deal(address(this), 1 ether); // Deal 1 ether to this contract
        assignment.deposit{value: 1 ether}(); // Deposit 1 ether
        uint contractBalance = assignment.getContractBalance(); // Get the contract balance
        assertEq(contractBalance, 1 ether, "Contract balance should be 1 ether"); // Assert contract balance is correct
    }

    // Function to receive Ether when testing withdraws or fallback payments
    receive() external payable {}
}
