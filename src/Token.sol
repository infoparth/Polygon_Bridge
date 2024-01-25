// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.19;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { ERC721, ERC721URIStorage } from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import { ERC721Enumerable } from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract Token is ERC721, Ownable, ERC721URIStorage, ERC721Enumerable{

  string[] public prompts;
  uint tokenId = 0;
  constructor() ERC721("Randomness", "RNS") Ownable(msg.sender) {
  }

  function batchMint(address _to, string[] memory uris) external onlyOwner{

    uint len = uris.length;

    for (uint i = 0; i < len; i++)
    {

        string memory current = uris[i];
        _mint(_to, tokenId);
        _setTokenURI(tokenId, current);
        tokenId += 1;

    }
  }

  function setPrompt(string[] memory _prompts) external onlyOwner{

    uint len = _prompts.length - 1;

    for (uint i = 0; i <= len; i++) {
        prompts.push(_prompts[len - i]);
    }
  }

  function promptDescription() public view returns(string[] memory)
  {

    return prompts;

  }

  // The following functions are overrides from solidity

  function _increaseBalance(address account, uint128 amount) internal virtual override(ERC721, ERC721Enumerable) 
  {
    super._increaseBalance(account, amount);
  }

  function _update(address to, uint256 tokenId, address auth) internal virtual override(ERC721, ERC721Enumerable) returns (address) 
  {
    return super._update(to, tokenId, auth);
  }

  function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721, ERC721URIStorage, ERC721Enumerable) returns (bool) 
  {
    return super.supportsInterface(interfaceId);
  }

  function tokenURI(uint256 tokenId) public view virtual override(ERC721, ERC721URIStorage) returns (string memory) 
  {
    return super.tokenURI(tokenId);
  }


}
