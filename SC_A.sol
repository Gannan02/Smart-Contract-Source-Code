// SPDX-License-Identifier: london

pragma solidity ^0.8.0;

contract ChallGen {
    event Deposit(uint[] si, uint[] vi);

    function ChallGen(uint c) public returns (uint[] memory, uint[] memory) {
        uint[] memory si = new uint[](c);
        uint[] memory vi = new uint[](c);

        for (uint i = 0; i < c; i++) {
            si[i] = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, block.number)));

            vi[i] = uint(keccak256(abi.encodePacked(si[i], block.coinbase, msg.sender)));
        }

        emit Deposit(si, vi);

        return (si, vi);
    }
}
