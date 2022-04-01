// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../Contract.sol";
import "forge-std/Vm.sol";

contract Receiver is ERC721TokenReceiver {
    function onERC721Received(
        address operator,
        address from,
        uint256 id,
        bytes calldata data
    ) external returns (bytes4) {
        return this.onERC721Received.selector;
    }
}

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

    function testWithdraw() public {
        Receiver receiver = new Receiver();

    }


}
