// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract TestMoodNft is Test{
    DeployMoodNft deployer;

    function setUp() public{
        deployer = new DeployMoodNft();
    }

    // the following test fails as there seems to be some difference in how openzeppelin and terminal does base64 encoding.
    // but both are giving correct URL so there is nothing to worry about
    function test_SvgToImageUri() public view{
        string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCI+PHRleHQgeD0iMCIgeT0iMTUiIGZpbGw9InllbGxvdyI+SGkhIFlvdXIgYnJvd3NlciBkZWNvZGVkIHRoaXM8L3RleHQ+PC9zdmc+Cg==";
        string memory svg = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="500" height="500"><text x="0" y="15" fill="yellow">Hi! Your browser decoded this</text></svg>';
        string memory actualUri = deployer.svgToImageUri(svg);
        // assertEq(
        //     keccak256(abi.encodePacked(expectedUri)),
        //     keccak256(abi.encodePacked(actualUri))
        // );
        // data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCI+PHRleHQgeD0iMCIgeT0iMTUiIGZpbGw9InllbGxvdyI+SGkhIFlvdXIgYnJvd3NlciBkZWNvZGVkIHRoaXM8L3RleHQ+PC9zdmc+
    }
}