pragma solidity ^0.5.16;

import "../METoken/node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";


contract Deed is ERC721Token {

    event DeedRegistered(address _by, uint _tokenId);

    constructor(string memory _name, string memory _symbol)
        public ERC721Token(_name,_symbol){}

    
    function register(uint _tokenId, string memory _uri) public{
        _mint(msg.sender, _tokenId);
        addMetaData(_tokenId,_uri);
        emit DeedRegistered(msg.sender,_tokenId);
    }
    function addMetaData(uint _tokenId, string memory _uri) public returns(bool) {
        _setTokenURI(_tokenId, _uri);
        return true;
    }

}