pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OneInchVIPToken is ERC20, Ownable {
    // staking token address (1INCH)
    IERC20 public stakingToken;

    // airdrop status control
    bool public isAirdropActive = true;

    constructor(IERC20 _stakingToken) ERC20("1inch VIP", "1VIP") {
        stakingToken = _stakingToken;
    }

    // disable token transfer
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        require(from == address(0) || to == address(0), "1inch VIP: Transfers not allowed");
    }

    function airdropTokens(address[] memory recipients) external onlyOwner {
        require(isAirdropActive, "1inch VIP: Airdrop is not active");

        for (uint256 i = 0; i < recipients.length; i++) {
            address recipient = recipients[i];
            uint256 stakedAmount = stakingToken.balanceOf(recipient);

            if (stakedAmount >= 1000 * (10 ** decimals())) {
                _mint(recipient, 1 * (10 ** decimals()));
            }
        }
    }

    // allow the contract owner to retract airdrop
    function toggleAirdropStatus() external onlyOwner {
        isAirdropActive = !isAirdropActive;
    }
}
