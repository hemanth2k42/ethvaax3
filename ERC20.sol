// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Hemanth is ERC20
{
    address public King;

    modifier onlyOwner() 
    {
        require(msg.sender == King, "Only the contract King can perform this action");
        _;
    }

    constructor() ERC20("Hemanth", "He")
    {
        King = msg.sender;
    }

    function mintToken(address account, uint256 amount) external onlyOwner
    {
        _mint(account, amount);
    }

    function burnToken(address account, uint256 amount) external 
    {
        require(msg.sender == account, "You can only burn your own tokens");
        _burn(account, amount);
    }

    function transferToken(address recipient, uint256 amount) external returns (bool) 
    {
        return transfer(recipient, amount);
    }
}
