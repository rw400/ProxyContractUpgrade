pragma solidity ^0.5.0;

import "./KeyValueStorage.sol";

contract StorageState {
    KeyValueStorage database; 
}

library StorageLibrary {

    event UpdateGame (bool changed);
    
    // struct Game {
    //     string gameTitle;
    //     uint gameCounter;
    //     uint Player1Bid;
    //     uint Player2Bid;
    // }

    // function init(Game storage self, string memory _gameTitle, uint _gameCounter) public {
    //     self.gameTitle = _gameTitle;
    //     self.gameCounter = _gameCounter;
    // }

    function setGame(KeyValueStorage database, string memory _gameTitle) public {
        database.setString(keccak256("GameTitle"), _gameTitle);

        emit UpdateGame(true);
    }

    function getGame(KeyValueStorage database) public view returns (string memory _gametitle) {
       
        return database.getString(keccak256("GameTitle"));
    }
}
