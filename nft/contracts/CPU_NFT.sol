// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

//Import Openzeppelin ERC1155 Contract
//Import Openzeppelin Ownable Contract
//Import Openzeppelin SafeMath Contract

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract CPUNft is ERC1155, Ownable {

    struct CPU {
        uint256 clock_speed;
        uint8 core_count;
        uint8 wattage;
        string grade; 
    }

    uint256 public constant CPU =0;

    mapping (uint256 => CPU) private _tokendetails;

        constructor(string memory name, string memory symbol) public ERC1155(name, symbol) {
        _mint(msg.sender, CPU, 1, "");
    }

    function mint( address account, uint256 id, uint256 amount) public onlyOwner {
        _safemint(account, id, amount, "");
    }

    function burn (address account, uint256 id, uint256 amount) public {
        require(msg.sender == account);
        _burn(account, id, amount);
    }
}