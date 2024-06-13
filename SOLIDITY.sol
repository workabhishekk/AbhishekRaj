// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract CryptoToken {

    // Public variables
    string public tokenName;
    string public tokenAbbrv;
    uint public totalSupply;

    // Balances mapping
    mapping(address => uint) public balances;

    // Events for minting and burning tokens
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    // Constructor to initialize token details
    constructor() {
        tokenName = "CryptoCoin";
        tokenAbbrv = "CC";
        totalSupply = 0;
    }

    // Function to mint tokens
    function mint(address _to, uint _value) public {
        require(_to != address(0), "Invalid address");
        totalSupply += _value;
        balances[_to] += _value;
        emit Mint(_to, _value);
    }

    // Function to burn tokens
    function burn(address _from, uint _value) public {
        require(_from != address(0), "Invalid address");
        require(balances[_from] >= _value, "Not enough tokens to burn");
        balances[_from] -= _value;
        totalSupply -= _value;
        emit Burn(_from, _value);
    }

    // Function to check the balance of an address
    function balanceOf(address _account) public view returns (uint) {
        return balances[_account];
    }
}
