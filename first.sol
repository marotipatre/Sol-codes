// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.18;

contract simplestorage{
    //This will get initialize to 0
    uint256 public favoritenumber;

        function store(uint256 _favoritenumber) public {
            favoritenumber = _favoritenumber;
        }

        struct People{
            uint favoritenumber;
            string name;
        }

        People[] public people;
        mapping (string => uint256) public nametofavoritenumber;

        function addperson(string memory _name,uint256 _favoritenumber) public {
            people.push(People(_favoritenumber,_name));
            nametofavoritenumber[_name]= _favoritenumber;

        }
}
