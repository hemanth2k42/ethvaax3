// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol ";
contract Hemanth is ERC20
{
    constructor()ERC20("HEMANTH","HE")
    {
        _mint(msg.sender,1000);
    }
}
