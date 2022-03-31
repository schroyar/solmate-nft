// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import {ERC721} from "solmate/tokens/ERC721.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract Contract is ERC721, Ownable {

    uint256 public currentTokenId;
    uint256 public constant MINT_PRICE = 0.08 ether;
    uint256 public constant MAX_SUPPLY = 100;
    string public base_uri;
    mapping(uint256 => address) ownerOf;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _base_uri
    ) ERC721 (_name, _symbol) Ownable()
    {
        base_uri = _base_uri;
    }

    function mintTo(address recipient) public payable returns (uint256) {
        require(
            msg.value == MINT_PRICE,
            "msg.value < MINT_PRICE"
        );
        uint256 newItemId = ++currentTokenId;
        require(
            newItemId <= MAX_SUPPLY,
            "sold out"
        );
        _safeMint(recipient, newItemId);
        ownerOf[newItemId] = recipient;
        return newItemId;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            ownerOf[tokenId] != address(0),
            "non existent"
        );

        return "ok";

    }

    function withdrawBalance(address payable recipient) public onlyOwner {

    }
}
