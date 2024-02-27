// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract lottery{
      address manager;
      address payable[] public  particiapants;



    constructor(){
        manager = msg.sender;
    }

     receive() external payable { 
         require(msg.value == 2 ether);
          particiapants.push(payable(msg.sender));
     }


        function balance() public view returns(uint) {
            require(msg.sender == manager);
            return address(this).balance;
           
        }
     

     function winner() public returns (address)  {
            require(msg.sender == manager);
            require(particiapants.length >=3);
            uint random = (uint(keccak256(abi.encodePacked(blockhash(block.number - 1),block.timestamp,particiapants.length))))%particiapants.length;
            payable(particiapants[random]).transfer(balance());
            address payable  win = particiapants[random];
            particiapants = new address payable[](0);
            return win;
            
            



     }


}