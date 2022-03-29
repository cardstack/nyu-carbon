// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Test {

    event TokenTest(
        address from,
        bytes32 id,
        uint256 amount
    );

   function testemit(address _from, bytes32 _id, uint256 _val) public payable {      
      emit TokenTest(_from, _id, _val);

   }
}