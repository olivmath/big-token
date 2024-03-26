// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {BaseSetup} from "./BaseSetup.t.sol";

contract BigTokenTest is BaseSetup {
    function setUp() public override {
        BaseSetup.setUp();
    }

    function test_validadeBalance(address user) public {
        assertEq(btoken.balanceOf(user), 100 * 1e18);
    }

    function test_validadeTransfer(address user) public {
        btoken.transfer(alice, 13 * 1e18);
        assertEq(btoken.balanceOf(alice), 13 * 1e18);
    }
}
