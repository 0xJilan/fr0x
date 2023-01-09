// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/// @title MutualSlots
/// @author @0xJilan
/// @notice Mutual Slots option implementation
contract MutualSlots is Ownable {
    address public feeCollector; //address who receives fees generated by contract activity
    uint8 public FEE_NUMERATOR = 3; //numerator to calculate fees //TODO: transfer to Constructor
    uint16 public FEE_DENOMINATOR = 1000; //denominator to calculate fees //TODO: transfer to Constructor
    uint256 public MIN_BET = 0.001 ether; //minimum amount to bet //TODO: transfer to Constructor
    uint256 public MAX_BET = 100 ether; //maximum amount to bet //TODO: transfer to Constructor
    uint8 public GAP_NUMERATOR = 1; //numerator to calculate gap //TODO: transfer to Constructor
    uint16 public GAP_DENOMINATOR = 100; //denominator to calculate gap //TODO: transfer to Constructor
    uint8 public SLOTS = 10; //number of slots to buy in range

    /// @notice Calculate fees to be deducted from a given amount
    /// @dev Fee amount by dividing the numerator by the denominator which - e.g: 3/1000 = 0.003 or 0.3% percent;
    /// @param _amount amount between 1e15 & 1e20.
    /// @return fees amount in wei
    function getFeeByAmount(uint96 _amount) public view returns (uint256) {
        return _amount * FEE_NUMERATOR / FEE_DENOMINATOR;
    }

    /// @notice Calculate gap from percent of a given price
    /// @dev Gap amount by dividing the numerator by the denominator which - e.g: 1/100 = 0.01 or 1% percent;
    /// @param _price amount between 1e8 & 1e20.
    /// @return gap amount in 8 decimals number to fit Oracle format
    function getGapByPrice(uint256 _price) public view returns (uint256) {
        return _price * GAP_NUMERATOR / GAP_DENOMINATOR;
    }
}