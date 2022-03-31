// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract BCTToken is ERC20 {
    constructor(uint256 initialSupply) public ERC20("BCTToken", "BCT"){
        _mint(msg.sender, initialSupply);
    }
}
