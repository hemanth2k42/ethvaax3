
# MyToken

This project demonstrates the creation, deployment, and interaction with an ERC20-like token using Solidity and HardHat or Remix.

## Smart Contract

The `MyToken` contract allows the owner to mint tokens to a specified address and any user to burn or transfer tokens.

## Features

- **Mint Tokens:** Only the contract owner can mint new tokens.
- **Burn Tokens:** Any user can burn tokens from their balance.
- **Transfer Tokens:** Any user can transfer tokens to another address.

## Contract Overview

- **owner:** The address of the contract owner.
- **tokenName:** The name of the token ("Hemanth").
- **tokenSymbol:** The symbol of the token ("He").
- **totalSupply:** The total supply of the token.
- **balances:** A mapping of addresses to their respective token balances.

## Functions

- **mint:** Allows the contract owner to mint new tokens to a specified address.
- **burn:** Allows any user to burn tokens from their balance.
- **transfer:** Allows any user to transfer tokens to another address.

## Deployment

### Using HardHat

1. **Clone the repository and navigate to the project directory:**

   

2. **Install dependencies:**

    

3. **Compile the contract:**

   

4. **Deploy the contract:**

    Create a `scripts/deploy.js` file with the following content:

    
    async function main() {
        const [deployer] = await ethers.getSigners();
        console.log("Deploying contracts with the account:", deployer.address);

        const Token = await ethers.getContractFactory("MyToken");
        const token = await Token.deploy();

        console.log("Token deployed to:", token.address);
    }

    main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
 

### Using Remix

1. **Open Remix:** Go to [Remix](https://remix.ethereum.org/).

2. **Create a New File:** Create a new file named `MyToken.sol` and paste the contract code into it.

3. **Compile the Contract:** Use the Solidity compiler in Remix to compile the contract.

4. **Deploy the Contract:** Use the Deploy & Run Transactions module to deploy the contract to the desired network (e.g., Ethereum Mainnet, Rinkeby Testnet, etc.).

## Interaction

You can interact with the deployed contract using HardHat console or Remix.

### HardHat Console

1. **Start HardHat Console:**

  

2. **Mint Tokens:**


3. **Burn Tokens:**


4. **Transfer Tokens:**


