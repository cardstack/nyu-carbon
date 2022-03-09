// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract Crud {
    struct User {
        uint id;
        string name;
    }
    User[] public users;
    uint public nextId = 1;

    function create(string memory name) public{
        users.push(User(nextId, name));
        nextId++;
    }

    function read(uint id) view public returns(uint, string memory){
            uint ii = find(id);
            return(users[ii].id, users[ii].name);
        
    }

    function update(uint id, string memory name) public{
            uint ii = find(id);
            users[ii].name = name;            
    }

    function destroy(uint id) public {
        uint ii = find(id);
        delete users[ii];
    }

    function find(uint id) view internal returns(uint) {
        for(uint ii =0; ii< users.length; ii++){
                if(users[ii].id ==id)
                return ii;
        }
        revert('User does not exist!');
    }
}