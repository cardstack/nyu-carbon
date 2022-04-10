// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import 'BCTContract.sol';

contract NYUCarbonContract {
    address owner;
    uint256 amount;
    tokenBCT token;
    mapping(address => mapping(uint256 => uint256)) private offsets;
    mapping(address => mapping(uint256 => bool)) private green_status;

    // events that will be emited
    event burnt(address indexed sender, uint amount, uint256 time);
    event debit(address sender_address, address contract_address, uint256 amount, uint256 time);
    event carbon_free(address contract_address, uint256 amount, uint256 time);
    
    // State variable to ensure funtions are called ordinally: Pending -> Locked -> Burnt, prevent duplicate calls
    enum State {Pending, Locked, Burnt}
    State public state;
    error InvalidState();
    error InvalidOwner();

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
        require(msg.sender == owner, "only owner can burn the tokens");
        _;
    }

    function getBCTBalance() view public returns(uint){
        return token.balanceOf(address(this));
        
    }

    function BalanceOfSender() view internal returns(uint){
        return token.balanceOf(msg.sender);
    }

    function getTime() view internal returns(uint256) {
        return block.timestamp;
    }

    function getOffset(address contract_address, uint256 token_id) view public returns(uint) {
        return offsets[contract_address][token_id];
    }

    // user debit ERC20 tokens to the contract for burning
    function offsetNFT(address contract_address, uint256 token_id, uint256 amt) external inState(State.Pending) { 
        token.transferFrom(msg.sender, address(this), amt);
        emit debit(msg.sender, address(this), amt, getTime());
        
        // after receiving the fund, lock them in the contract
        state = State.Locked;

        // perform burning and stamping accordingly
        burnToken(contract_address, token_id, amt);
        stamping(contract_address, token_id, amt);
    }

    // burn all balance in the contract, only owner can burn the token
    function burnToken(address contract_address, uint256 token_id, uint256 amt) private isOwner inState(State.Locked) {
        // burn the balance
        require(getBCTBalance() > 0, "Not enough balance");
        token.burn(token.balanceOf(address(this)));
        
        // emit offset activity once burnt confirmed
        emit burnt(msg.sender, amt, getTime());

        // after burning success, change the state to burnt
        state = State.Burnt;

        // record the offsets
        offsets[contract_address][token_id] += amt;

    }

    // funciton of record offset amount and fake function of producing a green stamp
    // for now this function is conceptual
    // need to figure out: 1. how to let the contract know the current CO2 balance 2. if the CO2 balance change in some point, how to chance the status

    function stamping(address contract_address, uint256 token_id, uint256 CO2_balance) private inState(State.Burnt) {

        // get the CO2_balance from somewhere, for now we use offset amount as the CO2 balance, so every offseted token should be carbon free
        // true for carbon free; false for not carbon free
        if((getOffset(contract_address, token_id) - CO2_balance) >= 0) {
            green_status[contract_address][token_id] = true;
            emit carbon_free(contract_address, token_id, getTime());
        }else{
            green_status[contract_address][token_id] = false;
        }
        // all process finished, change the state back to pending, ready for another offset
        state = State.Pending;
    }
    
}
