// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    
    mapping(uint256 => uint256) private price_Value;
    mapping(address => string[]) private redeemedItems;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        price_Value[1] = 50;
        price_Value[2] = 79;  
        price_Value[3] = 109;  
    }

    function mintDegen(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function getDegenBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function transferTokensTo(address _receiver, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        transfer(_receiver, amount);
    }

    function burnToken(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }

    function gameStore() public pure returns (string[] memory) {
        string[] memory items = new string[](3);
        items[0] = "1. DEMONS Portion = 50";
        items[1] = "2. Elite Shield = 79";
        items[2] = "3. FRIZAAX NFT = 109";
        return items;
    }

    function redeemTokens(uint256 choice) external {
        require(choice >= 1 && choice <= 3, "Invalid selection");

        uint256 amountToRedeem = price_Value[choice];
        require(amountToRedeem > 0, "Invalid choice");

        require(balanceOf(msg.sender) >= amountToRedeem, "Insufficient balance");

        _burn(msg.sender, amountToRedeem);

        if (choice == 1) {
            redeemedItems[msg.sender].push("DEMONS Portion");
        } else if (choice == 2) {
            redeemedItems[msg.sender].push("Elite Shield");
        } else if (choice == 3) {
            redeemedItems[msg.sender].push("FRIZAAX NFT");
        }
    }

    function getRedeemedItems() external view returns (string[] memory) {
        return redeemedItems[msg.sender];
    }
}
