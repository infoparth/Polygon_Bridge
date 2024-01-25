# Poly NFT Bridge

This repo contains the smart contract for a simple NFT contract that is created on the GOERLI Blockchain.
The NFT token {0, 1, 2} are then Bridged over to the Polygon Blockchain, using the FxRoot bridge.

## Description

The primary goal of this project is to illustrate the process of bridging NFT tokens between different Ethereum-compatible blockchains. The chosen path involves minting NFTs on the GOERLI Blockchain and subsequently migrating them to the Polygon Blockchain using the FxRoot bridge.
The fucntions on the smart contract, after deployment are called using:

```
cast call
```

and

```
cast send
```

All the respective addresses, Transaction Hashes and the Prompts used for the creation of images
can be found in the ### .env.example

## Getting Started

To interact with the Token contract, you can start-off by cloning this repo and running
(you need to run these commands in a linux environment like Ubutu or WSL in case of Windows)

```
forge build
```

This will compile the code and run all the tests

Then, once the compilation is done, create a .env file and copy the contents of .env.example into .env and run:

```
cast wallet vanity --starts-with BEEF
```

to create a new Wallet, and store it's private key in the .env as PRIVATE_KEY

In the terminal to deploy your own NFT contract on the Goerli Blockchain run,

```
source .env
```

Then, run the following command, to deploy your contract on the Goerli blockchain

```
forge script script/Token.s.sol --rpc-url $GOERLI_URL --broadcast --verify -vvvv
```
Once your contract is live, change the "CONTRACT" variable in .env, you can test it by calling the "symbol()" function on your contract using 

```
cast call $CONTRACT \
"symbol()" --rpc-url $MUMBAI_URL
```

Create or use an address, to send your NFTs on the Mumbai Blockchain to, and run the following commands

```
cast send $GTOKEN_ADDRS "setApprovalForAll(address, bool)" \
$FX_ADDRS true \
--rpc-url $GOERLI_URL \
--private-key $PRIVATE_KEY
```
And then to deposit your NFTs using 

```
cast send $FX_ADDRS "deposit(address,address,uint256,bytes)" \
$GTOKEN_ADDRS $MUMBAI_ADDRESS <YOUR_TOKENID_HERE> 0x00 \
--rpc-url $GOERLI_URL \
--private-key $PRIVATE_KEY

```
And after about 20-25 minutes, you can see your NFT's on the Mumabai Blockchain, 

To find the address of the new Contract, after about 30 mins

search for your $MUMBAI_ADDRESS on the mumbai explorer and from there on look at the lates NFT transfers

if you can't see your NFTs yet, wait for some more time.

## Authors

Parth Verma

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
