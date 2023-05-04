#### ***1VIP is NOT an official token of 1inch Network. It is only an experimental project as part of my educational journey into web3 development._


# 1VIP - Token Contract

This is a README summary for an experimental `1inch 1-VIPToken` contract, an ERC20 token with special features, created to give 1INCH token stakers VIP access to events and parties.

## Features

- Used OpenZeppelin's ERC20 and Ownable contracts for a solid and secure foundation.
- Designed to airdrop tokens to specific addresses based on their staked 1INCH token amounts (i.e. <1000 st1INCH).
- Transfers between addresses are disabled to eliminate spoofing, allowing only minting and burning of the token.
- The contract owner has control over the airdrop status, enabling or disabling at the event team's discretion. 

## Main Functions

### Constructor

The constructor function initializes the contract with the staking token address (1INCH) and sets the token name and symbol.

### _beforeTokenTransfer

This function overrides the `_beforeTokenTransfer` function from the ERC20 contract to prevent token transfers between addresses.

### airdropTokens

This function is used to airdrop `OneInchVIPToken` to a list of recipient addresses, based on their staked 1INCH token amount. Only the contract owner can execute this function, and it will only work if the airdrop is active.

### toggleAirdropStatus

This function allows the contract owner to toggle the airdrop status (active or inactive) as needed.

## Usage

1. Deploy the contract with the staking token address (1INCH) as a parameter.
2. Use the `airdropTokens` function to airdrop tokens to eligible addresses.
3. The contract owner can enable or disable the airdrop using the `toggleAirdropStatus` function.
