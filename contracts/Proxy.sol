pragma solidity ^0.5.0;

import "./Ownable.sol";
import "./StorageLibrary.sol";

contract Proxy is StorageState , Ownable {
    
    address public currentLogicAddress;
    
    event LogicUpgraded(address indexed _addr);

    // Owner addressStorage key 
    constructor(KeyValueStorage database, address owner) public {
        database.setAddress("owner", owner);
    }

    function implementUpgrade(address addr) public onlyOwner {
        require(currentLogicAddress != addr, "Same Address");
        currentLogicAddress = addr;
        
        emit LogicUpgraded(addr);
    }
  
    function () external payable {
        address _current = currentLogicAddress;

        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, _current, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)

            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
        // assembly {
        //   let result := delegatecall(gas, _addr, add(data, 0x20), mload(data), 0, 0)
        //   let size := returndatasize
        //   let ptr := mload(0x40)
        //   returndatacopy(ptr, 0, size)
        //   switch result
        //   case 0 { revert(ptr, size) }
        //   default { return(ptr, size) }
        // }
    }
}