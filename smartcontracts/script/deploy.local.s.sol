// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Script, console2} from "forge-std/Script.sol";
import {BigToken} from "../src/BigToken.sol";

contract Local is Script {
    BigToken btoken;

    function setUp() public {}

    function run() public {
        vm.startBroadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);

        btoken = new BigToken();
        console2.log("BigToken address: ", address(btoken));

        vm.stopBroadcast();
    }
}
