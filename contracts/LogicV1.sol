pragma solidity ^0.5.0;

import "./SafeMath.sol";
import "./StorageLibrary.sol";

contract LogicV1 is StorageState {
    using SafeMath for uint256;
    
    function setMaxPlayers(uint256 num) public {
        database.setUint("PlayerAmount", num);
    }

    function getMaxPlayers() view public returns (uint256) {
        return database.getUint("PlayerAmount");
    }

    function setGameTitle(string memory gameTitle) public {
        database.setString("GameTitle", gameTitle);
    }

    function getGameTitle() view public returns (string memory) {
        return database.getString("GameTitle");
    }

    function deleteGameTitle(string memory) public {
        return database.deleteString("GameTitle");
    }

    function setPlayer1Bid(uint256 player1Bid) public {
        require (player1Bid > 0 , "invalid bid");
        database.setUint("Player1Bid", player1Bid);
    }

    function getPlayer1Bid() view public returns (uint256) {
        return database.getUint("Player1Bid");
    }

    function setPlayer2Bid(uint256 player2Bid) public {
        require (player2Bid > 0 , "invalid bid");
        database.setUint("Player2Bid", player2Bid);
    }

    function getPlayer2Bid() view public returns (uint256) {
        return database.getUint("Player2Bid");
    }

}