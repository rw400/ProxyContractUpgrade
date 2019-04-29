pragma solidity ^0.5.0;

import "./SafeMath.sol";
import "./LogicV1.sol";
import "./Ownable.sol";
import "./StorageLibrary.sol";

contract LogicV2 is StorageState {
    using SafeMath for uint256;
    using StorageLibrary for KeyValueStorage;
    
    modifier onlyOwner() {
        require(msg.sender == database.getAddress("owner"), "not owner");
        _;
    }

    function setMaxPlayers(uint256 num) public {
        database.setUint("PlayerAmount", num);
    }

    function getMaxPlayers() view public returns (uint256) {
        return database.getUint("PlayerAmount");
    }

    function deleteGameTitle(string memory) public {
        return database.deleteString("GameTitle");
    }

    // Implement Library
    function setGameLibrary(string memory _gameTitle) public {
        database.setGame(_gameTitle);
    }

    function getGameLibrary() public view returns (string memory _gameTitle) {
        return database.getGame();
    }
}