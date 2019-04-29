pragma solidity ^0.5.0;

import "./Ownable.sol";

contract KeyValueStorage {

    mapping(address => mapping(bytes32 => address)) private addressStorage;
    mapping(address => mapping(bytes32 => bytes32)) private bytesStorage;
    mapping(address => mapping(bytes32 => uint256)) private uintStorage;
    mapping(address => mapping(bytes32 => bool)) private boolStorage;
    mapping(address => mapping(bytes32 => string)) private stringStorage;


    // Additional mappings
    mapping(bytes32 => address) private addressMapping;
    mapping(bytes32 => bytes) private bytesMapping;
    mapping(bytes32 => uint) private uintMapping;
    mapping(bytes32 => bool) private boolMapping;
    mapping(bytes32 => string) private stringMapping;

    // Getters  
    function getAddress(bytes32 key) public view returns (address) {
        return addressStorage[msg.sender][key];
    }
    function getBytes(bytes32 key) public view returns (bytes32) {
        return bytesStorage[msg.sender][key];
    }
    function getUint(bytes32 key) public view returns (uint) {
        return uintStorage[msg.sender][key];
    }
    function getBool(bytes32 key) public view returns (bool) {
        return boolStorage[msg.sender][key];
    }
    function getString(bytes32 key) public view returns (string memory) {
        return stringStorage[msg.sender][key];
    }

    // Setters  
    function setAddress(bytes32 key, address value) public {
        addressStorage[msg.sender][key] = value;
    }
    function setBytes(bytes32 key, bytes32 value) public {
        bytesStorage[msg.sender][key] = value;
    }
    function setUint(bytes32 key, uint value) public {
        uintStorage[msg.sender][key] = value;
    }
    function setBool(bytes32 key, bool value) public {
        boolStorage[msg.sender][key] = value;
    }
    function setString(bytes32 key, string memory value) public {
        stringStorage[msg.sender][key] = value;
    }

    // Delete
    function deleteAddress(bytes32 key) public {
        delete addressStorage[msg.sender][key];
    }
    function deleteBytes(bytes32 key) public {
        delete bytesStorage[msg.sender][key];
    }
    function deleteUint(bytes32 key) public {
        delete uintStorage[msg.sender][key];
    }
    function deleteBool(bytes32 key) public {
        delete boolStorage[msg.sender][key];
    }
    function deleteString(bytes32 key) public {
        delete stringStorage[msg.sender][key];
    }

}
