pragma solidity 0.8.13;

import "./CustomDependencies.sol";

contract SecureSwap {
    mapping (address => uint256) private secretStashes;
    mapping (address => bool) private initializedSwaps;

    uint256 public immutable swapAmount;

    constructor(uint256 _swapAmount) {
        swapAmount = _swapAmount;
    }

    function initiateSwap() external notSwappedYet canSwap {
        // Initiate Swap
        secretStashes[msg.sender] += swapAmount;
        initializedSwaps[msg.sender] = true;
    }

    modifier notSwappedYet {
        require(!initializedSwaps[msg.sender], "You already initiated a Swap");
        _;
    }
