// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken {

    // public variables here
    string public tokenName = "MIGGYCASH";
    string public tokenAbbrv = "MIGCSH";
    uint public totalSupply = 0;

    // mapping variable here
    mapping(address => uint) public balances;

    // mint function
    function mint (address _address, uint _value) public {
        totalSupply += _value;
        balances[_address] += _value;
    }

    // burn function
    function burn (address _address, uint _value) public {
        if (balances[_address] >= _value) {
            totalSupply -= _value;
            balances[_address] -= _value;
        } else {
            revert("Too much supply inputted");
        }
    }

    // transfer function
    function transfer(address _from, address _to, uint _value) public {
        require(balances[_from] >= _value, "Insufficient balance");
        balances[_from] -= _value;
        balances[_to] += _value;
        totalSupply -= _value;
    }
}
