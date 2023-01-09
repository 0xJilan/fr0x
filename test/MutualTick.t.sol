// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MutualTick.sol";

contract MutualTickTest is Test {
    MutualTick public mutualTick;

    function setUp() public {
        mutualTick = new MutualTick();
        mutualTick.setNumber(0);
    }

    function testIncrement() public {
        mutualTick.increment();
        assertEq(mutualTick.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        mutualTick.setNumber(x);
        assertEq(mutualTick.number(), x);
    }
}
