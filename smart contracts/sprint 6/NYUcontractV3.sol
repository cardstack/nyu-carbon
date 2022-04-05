// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import 'BCTContract.sol';

contract NYUCarbonContract {
    address owner;
    uint256 amount;
    tokenBCT token;
    mapping(address => mapping(uint256 => uint256)) private offsets;
    mapping(address => mapping(uint256 => string)) private green_status;

    // events that will be emited
    event burnt(address indexed sender, uint amount, uint256 time);
    event debit(address sender_address, address contract_address, uint256 amount, uint256 time);
    event carbon_free(address contract_address, uint256 amount, uint256 time);
    
    // State variable to ensure funtions are called ordinally: Pending -> Locked -> Burnt, prevent duplicate calls
    enum State {Pending, Locked, Burnt}
    State public state;
    error InvalidState();

    constructor() {
        owner = msg.sender;
        amount = 0;
        token = tokenBCT(0xCb38eC62A43EB019F8d79b0C1C070ccdD16D1650);
    }

    modifier inState(State _state) {
        if (state != _state)
            revert InvalidState();
        _;
    }

    modifier isOwner{
        require(msg.sender == owner, "only owner can burn the token");
        _;
    }

    function getBCTBalance() view public returns(uint){
        return token.balanceOf(address(this));
        
    }

    function BalanceOfSender() view public returns(uint){
        return token.balanceOf(msg.sender);
    }

    function getTime() view public returns(uint256) {
        return block.timestamp;
    }

    function getOffset(address contract_address, uint256 token_id) view public returns(uint) {
        return offsets[contract_address][token_id];
    }

    // user debit ERC20 tokens to the contract for burning
    function offsetNFT(uint256 amt) external inState(State.Pending) { 
        token.transferFrom(msg.sender, address(this), amt);
        emit debit(msg.sender, address(this), amt, getTime());
        amount += amt;

        // after receiving the fund, lock them in the contract
        state = State.Locked;
    }

    // burn all balance in the contract, only this contract can burn the token
    function burnToken() public isOwner inState(State.Locked) {
        // burn the balance
        
        require(getBCTBalance() > 0, "Not enough balance");
        token.burn(token.balanceOf(address(this)));
        
        // emit offset activity once burnt confirmed
        emit burnt(msg.sender, amount, getTime());
        // after burning success, change the state to burnt
        state = State.Burnt;  
    }

    // funciton of record offset amount and fake function of producing a green stamp
    function stamping(uint256 CO2_balance, address contract_address, uint256 token_id) public inState(State.Burnt) {
        // record the offset amounts
        offsets[contract_address][token_id] += amount;

        // fake some balance, just for functionality check
        if(CO2_balance - getOffset(contract_address, token_id) == 0) {
            green_status[contract_address][token_id] = "Carbon Free";
            emit carbon_free(contract_address, token_id, getTime());
        }else{
            green_status[contract_address][token_id] = "Not Carbon Free";
        }
        // all process finished, change the state back to pending, ready for another offset
        state = State.Pending;
    }
}
