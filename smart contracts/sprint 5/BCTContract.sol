// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract tokenBCT is ERC20, ERC20Burnable {

    constructor(uint256 initialSupply) public ERC20("TCO2", "BCT") {
        _mint(msg.sender, initialSupply);
    }
}