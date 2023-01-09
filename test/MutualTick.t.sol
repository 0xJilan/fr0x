// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MutualTick.sol";

contract MutualTickTest is Test {
    MutualTick public mutualTick;

    function setUp() public {
        mutualTick = new MutualTick();
    }

    function testGetFeeAmount(uint96 _amount) public {
        vm.assume(_amount >= mutualTick.MIN_BET() && _amount <= mutualTick.MAX_BET());
        uint256 expected = _amount * mutualTick.FEE_NUMERATOR() / mutualTick.FEE_DENOMINATOR();
        emit log_named_uint("Amount Expected: ", expected);
        assertEq(mutualTick.getFeeAmount(_amount), expected);
    }
}
