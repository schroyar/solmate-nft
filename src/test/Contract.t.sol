// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Contract.sol";

contract ContractTest is DSTest {
    Contract private nft;

    function setUp() public {
        nft = new Contract("MARY", "MRY");
    }

    function testMintNo() public {
        nft.mintTo(address(1));
    }

    function testMintYes() public {
        nft.mintTo{value: 0.08 ether}(address(1));
    }


}
