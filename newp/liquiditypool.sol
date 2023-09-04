// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract LiquidityPool {
    IERC20 public tokenA;
    IERC20 public tokenB;
    address public owner;

    constructor(address _tokenA, address _tokenB) {
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
        owner = msg.sender;
    }

    function deposit(uint256 amountA, uint256 amountB) external {
        require(amountA > 0 && amountB > 0, "Must deposit tokens.");
        require(tokenA.transferFrom(msg.sender, address(this), amountA), "Transfer failed.");
        require(tokenB.transferFrom(msg.sender, address(this), amountB), "Transfer failed.");
    }

    function withdraw(uint256 amountA, uint256 amountB) external {
        require(amountA > 0 && amountB > 0, "Must withdraw tokens.");
        require(tokenA.transfer(msg.sender, amountA), "Transfer failed.");
        require(tokenB.transfer(msg.sender, amountB), "Transfer failed.");
    }
}