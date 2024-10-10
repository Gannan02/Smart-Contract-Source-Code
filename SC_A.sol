// SPDX-License-Identifier: london

pragma solidity ^0.8.0;

contract SC_A {
    event Deposit(bytes32 indexed si, bytes32 indexed vi);
    uint256 public constant p = 730750818665451621361119245571504901405976559617;

    function ChalGen(uint256 timestamp, uint256 difficulty, address coinbase) public {
        bytes32 raw_si = keccak256(abi.encodePacked(timestamp, difficulty, block.number));
        uint256 si = uint256(raw_si) % p;
        if (si == 0) {
            si = 1;
        }
        bytes32 raw_vi = keccak256(abi.encodePacked(si, coinbase, msg.sender));
        uint256 vi = uint256(raw_vi) % p;
        if (vi == 0) {
            vi = 1;
        }
        emit Deposit(bytes32(si), bytes32(vi));
    }
}