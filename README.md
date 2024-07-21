# ERC20 based Degen token

## Description

This is a simple smart contract that adheres to the standards of ERC20 token like mintinng, transfering, burning, etc, and with additional custom functionality(redeeming) for the project. This smart contract is deployed on Avalanche Fuji testnet and is built using OpenZeppelin libraries for added security and standard compliance.

### Features

* Minting: Only the contract owner can mint new tokens.
* Burning: Any user can burn their own tokens.
* Transferring: Any user can transfer their tokens to another address.
* Redeeming: Users can redeem tokens for in-game items.
  
## Getting started

* Setup the Avalanche Fuji testnet on desired platform like remix(injected provider Metamask), VScode(by manually configuring the hardhat configuration), etc.
* Get the code on platform.
* ### Deployment of code on Fuji testnet.
* Open the project in your preferred development environment (e.g., Remix, VSCode with Hardhat).
* Install OpenZeppelin Contracts:
`npm install @openzeppelin/contracts`
* Compile the contract using the Solidity compiler.
* Deploy the contract to your desired network:
* For Remix: Select the appropriate environment (e.g., JavaScript VM, Injected Web3) and deploy.

#### NOTE: Make sure the wallet is connected to appropriate network(Fuji Testnet).
* For Hardhat:

The hardhat configuration file should be modified in order to deploy the contract on Fuji testnet.

Use the following script to deploy:
```
async function main() {
  const Token = await ethers.getContractFactory("DegenToken");
  const token = await Token.deploy();
  await token.deployed();
  console.log("Token deployed to:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
```
* Interact with the by function buttons on remix, custom scripts on VScode or by creating a webpage.
* The deployed contract can be checked on snotrace testnet for avalanche through the deployed address.
* NOTE: Be cautious with the deployer's address and the functionalities of the code as after deploying the contract it cannot be changed.

## Authors

- Sunil Kumar
- sunilchaudhary5879@gmail.com

## License

This project is licensed under the MIT License
