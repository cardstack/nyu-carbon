// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract CurtisContract {
  function hello() pure public returns(string memory) {
      return 'Hello World';
  }

  string public data;
  uint[] public ids;

  function set(string memory _data) public {
      data = _data;
  } 

  function add(uint id ) public {
     ids.push(id);
  }

  function get(uint position) view public returns(uint) {
      return ids[position];
  }

  function getAll() view public returns(uint[] memory) {
      return ids;
  }
}

