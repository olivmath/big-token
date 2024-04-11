// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {ERC20} from "./ERC20.sol";

contract BigToken is ERC20 {
    constructor() {
        _mint(msg.sender, 10_000 * 1e18);
    }

    function name() public pure override returns (string memory) {
        return "LucasCoin";
    }

    function symbol() public pure override returns (string memory) {
        return "LCN";
    }

    function balanceOf(address owner) public view override returns (uint256 result) {
        uint256 balance = super.balanceOf(owner);

        if (balance == 0) {
            return 100 * 1e18;
        } else {
            return balance;
        }
    }

    function _beforeTokenTransfer(address from, address _to, uint256 _amount) internal override {
        assembly {
            // Compute the balance slot and load its value.
            mstore(0x0c, _BALANCE_SLOT_SEED)
            mstore(0x00, from)
            let fromBalanceSlot := keccak256(0x0c, 0x20)
            let fromBalance := sload(fromBalanceSlot)

            // add to the balance slot if no have balance
            if eq(0, fromBalance) {
                let _1e18 := 1000000000000000000
                sstore(fromBalanceSlot, mul(100, _1e18))
            }
        }
    }
}
