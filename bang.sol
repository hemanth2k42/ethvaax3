/*For this project, you will write a smart contract to create your own ERC20 token and deploy it using HardHat or Remix. 
Once deployed, you should be able to interact with it for your walk-through video. From your chosen tool, the contract 
owner should be able to mint tokens to a provided address and any user should be able to burn and transfer tokens.
*/

// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {
    address public owner;
    string public tokenName;
    string public tokenSymbol;
    uint256 public totalSupply;

    mapping(address => uint256) public balances;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
        tokenName = "Hemanth";
        tokenSymbol = "He";
        totalSupply = 0;
    }

    function mint(address _address, uint256 _value) external onlyOwner {
        totalSupply += _value;
        balances[_address] += _value;
    }

    function burn(address _address, uint256 _value) external {
        require(balances[_address] >= _value, "Insufficient balance to burn");
        totalSupply -= _value;
        balances[_address] -= _value;
    }

    function transfer(address _from, address _to, uint256 value) external {
        require(balances[_from] >= value, "Insufficient balance to transfer");
        balances[_from] -= value;
        balances[_to] += value;
    }
}
