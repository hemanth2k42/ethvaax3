/*For this project, you will write a smart contract to create your own ERC20 token and deploy it using HardHat or Remix. 
Once deployed, you should be able to interact with it for your walk-through video. From your chosen tool, the contract 
owner should be able to mint tokens to a provided address and any user should be able to burn and transfer tokens.
*/

// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract MyToken is IERC20 {
    address public owner;
    string public tokenName;
    string public tokenSymbol;
    uint256 private _totalSupply;

    mapping(address => uint256) private _balances;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
        tokenName = "Hemanth";
        tokenSymbol = "He";
        _totalSupply = 0;
    }

    function totalSupply() external view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) external view override returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) external override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function mint(address _address, uint256 _value) external onlyOwner {
        _mint(_address, _value);
    }

    function burn(address _address, uint256 _value) external {
        _burn(_address, _value);
    }

    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "Transfer from the zero address is not allowed");
        require(recipient != address(0), "Transfer to the zero address is not allowed");

        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "Transfer amount exceeds sender balance");
        _balances[sender] -= amount;
        _balances[recipient] += amount;

    }

    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "Mint to the zero address is not allowed");

        _totalSupply += amount;
        _balances[account] += amount;
    }

    function _burn(address account, uint256 amount) internal {
        require(account != address(0), "Burn from the zero address is not allowed");

        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "Burn amount exceeds account balance");
        _balances[account] -= amount;
        _totalSupply -= amount;
    }
}
