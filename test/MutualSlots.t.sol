// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MutualSlots.sol";

contract MutualSlotsTest is Test {
    MutualSlots public mutualSlots;

    function setUp() public {
        mutualSlots = new MutualSlots();
    }

    function testGetFeeByAmount(uint96 _amount) public {
        vm.assume(_amount >= mutualSlots.MIN_BET() && _amount <= mutualSlots.MAX_BET());
        uint256 expected = _amount * mutualSlots.FEE_NUMERATOR() / mutualSlots.FEE_DENOMINATOR();
        emit log_named_uint("Amount Expected: ", expected);
        assertEq(mutualSlots.getFeeByAmount(_amount), expected);
    }

    function testGetGapByPrice(uint256 _price) public {
        vm.assume(_price >= 1e8 && _price <= 1e14);
        uint256 expected = _price * mutualSlots.GAP_NUMERATOR() / mutualSlots.GAP_DENOMINATOR();
        emit log_named_uint("Gap Expected: ", expected);
        assertEq(mutualSlots.getGapByPrice(_price), expected);
    }

    function testGetSlotSize(uint256 _gap, uint8 _slots) public {
        vm.assume(_gap >= 1e8 && _gap <= 1e13 && _slots >= 1);
        uint256 expected = _gap / _slots;
        emit log_named_uint("Slot size Expected: ", expected);
        assertEq(mutualSlots.getSlotSize(_gap, _slots), expected);
    }
    //TODO: Test way of time is implemented
}
