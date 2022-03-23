// SPDX-License-Identifier: MIT
// Specifies that the source code is for a version
// of Solidity greater than 0.5.10
pragma solidity ^0.8.10;

contract show_CO2 {

    // public variable emission, recording the emission from our model
    int public emission;

    constructor() {
        emission = 0;
    }

    function get() public view returns(int){
        return emission;
    }

    function set(int new_emission) public{
        emission = new_emission;
    }
   // fake offset function, giving a number of offset tokens
    function offset( int token_id, int amount) public{
       set(token_id * amount);
    }
}