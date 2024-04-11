// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Script, console2} from "forge-std/Script.sol";
import {BigToken} from "../src/BigToken.sol";

contract Local is Script {
    BigToken btoken;

    function setUp() public {}

    function run() public {
        vm.startBroadcast(0x2c1cd7aaf98854bdb45aa5a7463f8a98d3f1003f5bd9271ed500a630f7c451f1);

        btoken = new BigToken();
        console2.log("BigToken address: ", address(btoken));

        vm.stopBroadcast();
    }
}
