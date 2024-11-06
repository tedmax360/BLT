// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankAccount {
  address public accountholder;
    constructor()
    {
  accountholder=msg.sender;
    }

//0xf8e81D47203A594245E36C48e151709F0C19fBe8
   uint256 balance=0;
   function deposite()public payable 
   {
    require(msg.value > 0, "Deposite amount should be greater than 0");
    require(msg.sender==accountholder,"you are not account owner");
    balance +=msg.value;
   }
   function withdraw() payable public {
        require(balance > 0, "Withdrawal amount should be greater than zero");
        require(msg.sender==accountholder,"you are not account owner");
        payable(msg.sender).transfer(balance);
        balance = 0;
    }
   function showbalance() public view returns(uint)
   {
 require(msg.sender==accountholder,"you are not account owner");
return balance;
   }
}



/**

This Solidity contract defines a BankAccount smart contract that allows an account holder to deposit, withdraw, and check the balance of their account. 
The contract includes several important functionalities such as handling deposits, withdrawals, and enforcing ownership checks to ensure only the account 
holder can interact with their balance. Here’s a detailed explanation of each part of the contract:

1. License Identifier:
solidity
Copy code
// SPDX-License-Identifier: MIT
The contract is licensed under the MIT license. This is a standard license used for open-source code, which allows others to use, modify, 
and distribute the code.


2. Pragma Directive:
solidity
Copy code
pragma solidity ^0.8.0;
This line specifies that the contract is written for Solidity version 0.8.0 or higher. The ^ symbol indicates that any version from 0.8.0 to 
the next major version (but not including it) is acceptable.


3. Contract Declaration:
solidity
Copy code
contract BankAccount {
This declares the smart contract named BankAccount.


4. State Variables:
solidity
Copy code
address public accountholder;
uint256 balance = 0;
accountholder: This state variable stores the address of the account holder (the person who owns the account). It is set to public, 
meaning a getter function is automatically created for it. balance: This state variable stores the balance of the account. It is initialized to 0.


5. Constructor:
solidity
Copy code
constructor() {
    accountholder = msg.sender;
}
The constructor is executed once when the contract is deployed.
msg.sender refers to the address that deployed the contract. This address is set as the account holder in the contract.
This ensures that only the person who deployed the contract can interact with it as the account holder.


6. Deposit Function:
solidity
Copy code
function deposite() public payable {
    require(msg.value > 0, "Deposit amount should be greater than 0");
    require(msg.sender == accountholder, "You are not the account owner");
    balance += msg.value;
}
This function allows the account holder to deposit ether into their account.
msg.value represents the amount of ether sent with the transaction (in wei). It must be greater than 0, as enforced by the first require statement.
The second require statement checks that only the account holder (the address that deployed the contract) can make the deposit. 
If someone else tries to deposit, it will revert with the error message "You are not the account owner".
If both conditions pass, the deposit amount (msg.value) is added to the balance.


7. Withdraw Function:
solidity
Copy code
function withdraw() payable public {
    require(balance > 0, "Withdrawal amount should be greater than zero");
    require(msg.sender == accountholder, "You are not the account owner");
    payable(msg.sender).transfer(balance);
    balance = 0;
}
This function allows the account holder to withdraw the entire balance.
The first require statement ensures that there is a balance greater than 0 to withdraw. If the balance is 0, the function will revert with the 
error message "Withdrawal amount should be greater than zero". The second require statement ensures that only the account holder can withdraw the balance. 
If someone else tries to withdraw, it will revert with the error message "You are not the account owner".
The payable(msg.sender) part sends the entire balance to the account holder’s address.
Finally, the balance is reset to 0 after the withdrawal to ensure the account holder has withdrawn all the funds.


8. Show Balance Function:
solidity
Copy code
function showbalance() public view returns(uint) {
    require(msg.sender == accountholder, "You are not the account owner");
    return balance;
}
This function allows the account holder to check their current balance.
The require statement ensures that only the account holder can view the balance. If anyone else tries to call this function, 
it will revert with the error message "You are not the account owner".
The function returns the current balance of the account.



Summary of the Code’s Functionality:
Create an Account:
The account holder is set when the contract is deployed (the address deploying the contract becomes the account holder).
Deposit Ether:
The account holder can deposit ether by calling the deposite() function. The amount deposited is added to the balance.
Withdraw Ether:
The account holder can withdraw the entire balance by calling the withdraw() function. The ether is transferred to the account holder’s address, and the balance is reset to 0.
Check Balance:
The account holder can check their balance at any time by calling the showbalance() function.



Example Usage:
Create Account:
When the contract is deployed, the address that deploys it becomes the account holder.

Deposit:
The account holder calls the deposite() function, sending some ether with the transaction. The contract adds the ether to the account holder’s balance.

Withdraw:
The account holder calls the withdraw() function to withdraw the entire balance. After the withdrawal, the balance is reset to 0.

Check Balance:
The account holder can check their balance using the showbalance() function, which will return the current balance.

*/
















