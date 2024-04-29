// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract CrocodileGame is Ownable, VRFConsumerBase {
    // Variables
    address payable[] public players;
    address public crocodile;
    // set this in the future, of how much each game is worth
    uint256 public entryFee = 0.03 ether;
    // fee is at 3 %
    uint256 public feePercentage = 3;
    uint256 public totalPot;
    uint256 public crocodileFee;

    // Events
    event PlayerJoined(address indexed player);
    event CrocodileBite(address indexed player);
    event WinnersAnnounced(address[] winners);

    // Constructor
    constructor(
        address _vrfCoordinator,
        address _linkToken,
        bytes32 _keyHash
    ) VRFConsumerBase(_vrfCoordinator, _linkToken) {}

    // Functions
    function joinGame() external payable {
        require(msg.value == entryFee, "Incorrect entry fee");
        players.push(payable(msg.sender));
        emit PlayerJoined(msg.sender);
    }

    function pokeCrocodile() external {
        // Functionality for poking the crocodile
        // Implement randomness to determine if the crocodile bites or not
    }

    function distributeWinnings() internal {
        // Functionality for distributing winnings to winners
    }

    function withdrawCrocodileFee() external onlyOwner {
        // Withdraw accumulated crocodile fee
        require(crocodileFee > 0, "No funds to withdraw");
        payable(owner()).transfer(crocodileFee);
        crocodileFee = 0;
    }

    function withdrawWinnings() external {
        // Functionality for winners to withdraw their winnings
    }
}
