pragma solidity ^0.8.0;

contract AIGeneratedNFT {
    mapping(uint256 => address) private _owners;
    mapping(uint256 => string) private _tokenURIs;
    mapping(address => uint256) private _balances;

    uint256 private _tokenIdCounter;
    address private _owner;

    modifier onlyOwner() {
        require(msg.sender == _owner, "Not the contract owner");
        _;
    }

    modifier onlyTokenOwner(uint256 tokenId) {
        require(msg.sender == _owners[tokenId], "Not the token owner");
        _;
    }

    function mintNFT() public {
        _tokenIdCounter++;
        _owners[_tokenIdCounter] = msg.sender;
        _balances[msg.sender]++;
        _tokenURIs[_tokenIdCounter] = "ipfs://default-metadata";
    }

    function updateTokenURI(uint256 tokenId, string memory newURI) public onlyTokenOwner(tokenId) {
        _tokenURIs[tokenId] = newURI;
    }

    function tokenURI(uint256 tokenId) public view returns (string memory) {
        return _tokenURIs[tokenId];
    }

    function ownerOf(uint256 tokenId) public view returns (address) {
        return _owners[tokenId];
    }

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }
}
