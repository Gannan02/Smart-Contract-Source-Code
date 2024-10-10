// SPDX-License-Identifier: london

pragma solidity ^0.8.0;

contract SC_B {
    event Deposit(bytes32 indexed TrSC_A, bytes32 indexed Trproof, bytes32 S, uint256 timestamp);
    event NotifyRecipient(address recipient, bytes32 psi);
    uint256 public constant P = 730750818665451621361119245571504901405976559617;

    function AuditConsolidation(bytes32 TrSC_A, bytes32 Trproof, bytes32 S1, bytes32 S2, bytes32 psi) public {
        bytes32 rawS = keccak256(abi.encodePacked(S1, S2, psi));
        uint256 S = uint256(rawS) % P;
        if (S == 0) {
            S = 1;
        }
        emit Deposit(TrSC_A, Trproof, bytes32(S), block.timestamp);
        address AddrU = msg.sender;
        call_recipient(AddrU, psi);
    }

    function call_recipient(address recipient, bytes32 psi) internal {
        (bool success, ) = recipient.call(abi.encodeWithSignature("receivePsi(bytes32)", psi));
        
        if (!success) {
            emit NotifyRecipient(recipient, psi);
        }
    }
}