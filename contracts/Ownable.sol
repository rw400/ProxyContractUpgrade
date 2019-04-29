pragma solidity ^0.5.0;

contract Ownable {
    address owner;

    event OwnershipTransferred(address indexed _previousOwner, address indexed _newOwner);

    constructor() public {
        owner =  msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "previous owner");
        
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

}
