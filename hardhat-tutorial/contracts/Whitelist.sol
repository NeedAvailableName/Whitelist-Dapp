//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    //Max number of whitelisted addresses
    uint8 public maxWhitelistedAddresses;
    //if an address is whitelisted, it is true, else it is false 
    mapping(address => bool) public whitelistedAddresses;
    //store number of whitelisted addresses
    uint8 public numAddressesWhitelisted;
    //set maxWhitelistedAddresses
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }
    function addAddressToWhitelist() public {
        //check user is whitelisted or not
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        //check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
        //add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        //increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }

}