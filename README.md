# Types-of-Functions-ETH-AVAX

This Solidity program includes a contract that lets you mint, burn, and transfer tokens to other accounts.

## Getting Started

### Executing program

- To get started with the `MyToken` contract, you'll need to use the [Remix's Solidity IDE](https://remix.ethereum.org/).
- Once you are on the Remix website, create a new file named `MyToken.sol`.
- Copy and paste the `MyToken` contract code you created into the `MyToken.sol` file.
```
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
```
- Finally, compile the contract by selecting the Solidity compiler and clicking the "Compile" button.

### Deploying the Contract

1. In Remix, go to the "Deploy & Run Transactions" tab.
2. Select the `MyToken` contract from the dropdown menu.
3. Choose the appropriate environment (e.g., JavaScript VM, Injected Web3 for MetaMask, etc.), for this I selected Cancun.
4. Click the "Deploy" button to deploy the contract.

### Interacting with the Contract

* Once deployed, you can interact with the contract using the Remix interface.
   - To mint tokens to an account, copy the account's address and paste it in the address field, then input the value to be minted, then click the `mint` button. This will add the total supply of tokens.
   - To burn tokens to an account, copy the account's address and paste it in the address field, then input the value to be burned, then click the `burn` button. This will deduct the total supply of tokens.
   - To transfer tokens from one account to another, copy a different account's address and paste it in the `to` field, then copy the previous account's address and paste it in the `from` address field, then input the value to be transferred to the other account, then click the `transfer` button. This will transfer the total supply of tokens from the first account, to a second account.

## Authors

Miguel Lacanienta
[@MiguelLacanienta](https://www.facebook.com/miguel.lacanienta.16/)
