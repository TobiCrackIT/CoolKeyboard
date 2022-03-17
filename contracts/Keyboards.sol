// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

contract Keyboards {
    enum KeyboardKind {
        SixtyPercent,
        SeventyFivePercent,
        EightyPercent,
        Iso105
    }

    struct Keyboard {
        KeyboardKind kind;
        // ABS = false, PBT = true
        bool isPBT;
        // tailwind filters to layer over
        string filter;
        address owner;
    }

    Keyboard[] public createdKeyboards;

    function getKeyboards() public view returns (Keyboard[] memory) {
        return createdKeyboards;
    }

    function create(
        KeyboardKind _kind,
        bool _isPBT,
        string calldata _filter
    ) external {
        Keyboard memory newKeyboard = Keyboard({
            kind: _kind,
            isPBT: _isPBT,
            filter: _filter,
            owner: msg.sender
        });
        createdKeyboards.push(newKeyboard);
    }

    function tip(uint _index) external payable{
        address payable owner = payable(createdKeyboards[_index].owner);
        owner.transfer(msg.value);
    }
}

//Contract Address - 0x53E13B27970de22393a3766Fcf3C3f5002790E40

//Etherscan - https://rinkeby.etherscan.io/address/0x53E13B27970de22393a3766Fcf3C3f5002790E40
