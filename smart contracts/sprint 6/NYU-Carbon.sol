// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import 'BCTContract.sol';

contract NYUCarbonContract {

    mapping(address => mapping(uint256 => uint256)) private offsets;
    event OffsetNFT(address indexed sender, uint amount);
    tokenBCT token = tokenBCT(0xCb38eC62A43EB019F8d79b0C1C070ccdD16D1650);
    
    function getBCTBalance() view public returns(uint){
        return token.balanceOf(address(this));
    }
 
    function offsetNFT(address contract_address, uint256 token_id, uint256 amt) external { 
        token.transferFrom(msg.sender, address(this), amt);
        offsets[contract_address][token_id] += amt;
        emit OffsetNFT(msg.sender, amt);
        
    }  

    function getOffset(address contract_address, uint256 token_id) view external returns(uint) {
        return  offsets[contract_address][token_id];
    }

    // burn all balance in the contract
    function burnToken() public{
        token.burn(token.balanceOf(address(this)));
        
    }



}