// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//ERC721
//contract address 0x966e6FA315B5F9712F624288077B18a4cc40b95A 
contract MyNFT is ERC721 {
    //计数器绑定到Counter 类型
    using Counters for Counters.Counter;

    //声明一个私有的计数器用于跟踪令牌ID
    Counters.Counter private _tokenIds;

    //令牌ID关联元数据
    mapping(uint256 tokenId => string) private _tokenURIs;

    event MetadataUpdate(address addr, uint256 _tokenId);

    constructor() ERC721("Curios", "MCT") {}

    //给用户铸造NFT
    //样例：https://azure-many-mollusk-643.mypinata.cloud/ipfs/bafkreiguuts6utq2dmfphuhw2ocw6pky5mhgmgyk2iv7mg2oswgb6k7zzq
    function mintNFT(address recipient, string memory _tokenURI) public returns (uint256) {
        //增加计数器值
        _tokenIds.increment();
        //获取当前计数器值+当前区块时间戳作为新令牌ID
        uint256 _tokenId = _tokenIds.current() + block.timestamp;
        //给用户铸造 NFT
        _mint(recipient, _tokenId);
        //设置关联元数据
        _tokenURIs[_tokenId] = _tokenURI;
        emit MetadataUpdate(recipient, _tokenId);
        return _tokenId;
    }

    //继承覆盖获取tokenURI的方法
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        return _tokenURIs[tokenId];
    }
}