// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import 'BCTContract.sol';

contract NYUCarbonContract {
    address owner;
    bool flag_burnt;
    uint256 amount;
    mapping(address => mapping(uint256 => uint256)) private offsets;
    mapping(address => mapping(uint256 => uint256)) private green_status;

    event burnt(address indexed sender, uint amount, uint256 time);
    event debit(address contract_address, uint256 amount, uint256 time);

    

    constructor() {
        owner = msg.sender;
        flag_burnt = false;
        amount = 0;
        tokenBCT token = tokenBCT(0xCb38eC62A43EB019F8d79b0C1C070ccdD16D1650);
    }

    function getBCTBalance() view public returns(uint){
        return token.balanceOf(address(this));
    }

    function getTime() public view returns(uint256) {
        return block.timestamp;
    }

    function getOffset(address contract_address, uint256 token_id) view external returns(uint) {
        return offsets[contract_address][token_id];
    }

    // user debit ERC20 tokens to the contract for burning
    function offsetNFT(uint256 amt) external { 
        token.transferFrom(msg.sender, address(this), amt);
        emit debit(address(this), amt, getTime());
        amount += amt;
    }

    // burn all balance in the contract, only the owner can burn the token
    function burnToken() public isOwner {
        // burn the balance
        require(getBCTBalance() > 0, "Not enough balance");
        token.burn(token.balanceOf(address(this)));
        // emit offset activity once burnt confirmed
        emit burnt(msg.sender, amount, getTime());
        flag_burnt = true;   
    }

    modifier isOwner{
        require(msg.sender == owner, "only owner can burn the token");
        _;
    }

    // funciton of record offset amount and fake function of producing a green stamp
    function stamping(uint256 CO2_balance, address contract_address, uint256 token_id) public returns(bool) {
        // record the offset amounts
        require(flag_burnt == true, "please burn the token first");
        offsets[contract_address][token_id] += amount;

        // fake some balance, just for functionality check
        CO2_balance = getOffset(contract_address, token_id);
        if(full_offset = CO2_balance - getOffset(contract_address, token_id) == 0) {
            green_status[contract_address][token_id] = "Carbon Free";
        }else{
            green_status[contract_address][token_id] = "Not Carbon Free";
        }
    }
}
