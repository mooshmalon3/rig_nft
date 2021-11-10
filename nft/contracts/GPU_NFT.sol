// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

//Import Openzeppelin ERC1155 Contract
//Import Openzeppelin Ownable Contract
//Import Openzeppelin SafeMath Contract

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract GpuNft is ERC1155, Ownable {


    struct GPU {
        uint256 gpu_clock;
        string memory_type;
        uint8 memory_size;
        uint8 fan_count;
        uint256 wattage;
        string grade;
    }

    uint256 public constant GPU = 0;

    mapping (uint256 => GPU) private _tokendetails;

        constructor(string memory name, string memory symbol) public ERC1155(name, symbol) {
        _mint(msg.sender, GPU, 1, "");
    }

    function mint( address account, uint256 id, uint256 amount) public onlyOwner {
        _safemint(account, id, amount, "");
    }

    function burn (address account, uint256 id, uint256 amount) public {
        require(msg.sender == account);
        _burn(account, id, amount);
    }
}