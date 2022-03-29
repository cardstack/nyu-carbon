// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract NYUCarbonContract {
    mapping(address => mapping(uint256 => uint256)) private offsets;
    event token_offset(address contract_address, uint256 id, uint256 amount);
    uint256 BCT= 1000;
    
    function offset_nft(address contract_address, uint256 token_id, uint256 amt) public{
        
        offsets[contract_address][token_id] += amt;
        BCT = BCT - amt;
        emit token_offset(contract_address, token_id, amt);
    }  

    function getBalance() view public returns(uint) {
        return BCT;
    }

    function getOffset(address contract_address, uint256 token_id) view public returns(uint) {
        return  offsets[contract_address][token_id];
    }

}