// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

//Import Openzeppelin ERC721 Contract
//Import Openzeppelin Ownable Contract
//Import Openzeppelin SafeMath Contract

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract RigNft is ERC721, Ownable {

    struct MyRig {
        uint256 hashrate;
        uint8 gpu_temp;
        uint8 rig_temp;
        uint256 system_powerlevel;
        string miner_os;
        string grade;

    }

 
    uint256 public constant MyRig = 0;

    mapping(uint256 => MyRig) private _tokenDetails;

    constructor(string memory name, string memory symbol) public ERC721(name, symbol) {
        _mint(msg.sender, MyRig, 8, "");
    }

    function mint( address account, uint256 id, uint256 amount) public onlyOwner {
        _safemint(account, id, amount, "");
    }

    function burn (address account, uint256 id, uint256 amount) public {
        require(msg.sender == account);
        _burn(account, id, amount);
    }

    function mine (uint256 hashrate, uint8 gpu_temp, uint8 rig_temp, uint256 system_powerlevel, string miner_os, string grade) public onlyOwner {
        
    }

}