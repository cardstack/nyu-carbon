# Sprint 4

### What is Smart Contract?

Smart contracts are rule-based computer programs that can make the decision based on the conditions that companies or people have built on them. The programs are written by statement like “if, while, for” in order to instruct the computers to process conditions. These programs can automatically verify, control, and execute the agreement and the conditions. The difference between smart contract and traditional contract is that in smart contract, code enforces the contract transaction, while in traditional contracts they are enforceable by law. 

Example:

Thinking of smart contract like the vending machines. When people are running the code of a smart contract, it is similar as you are choosing the items you want to obtain from the vending machine. Related functions within the smart contract will be executed. Sometimes, the operations require monetary compensation, that is the gas fee, sometime they are free, depending on types of smart contracts. 

### Difference between Dapps

What we should realize is that smart contract is different from Dapps. It is incorrect to understand smart contract as Dapps. Smart contract is just a piece of code that is stored on the blockchain. A Dapp connects the frontend to the backend and my use several smart contract to run. A Dapp is an interface for people to interact with a smart contract. It consists of the frontend and API to interact with the smart contract(s). A smart contract provides a way for a Dapp to interact with the blockchain.

### How Smart Contracts work?

There are three components.

1. the Parties
2. the Subject of the contract
3. the terms or conditions that apply to smart contracts

Each smart contract is put onto the blockchain that is broadcasted to the entire network and has an address. This code is executable on **every node in the network. Each node has the history of all smart contracts, the history of all transactions, and the current state of all smart contracts.**

### Concepts about smart contracts

1. Turing Completeness

Solidity is the program language used on ethereum. It is the turing complete language that support programs with any logic, including loops.

One of the disadvantage of loop is that it will slow down the entire blockchain if an infinite or computationally loop is put into the system.

1. Gas

a fee that the developer of the smart contract has to pay for executing **any operation** on the Ethereum platform. It encourages programmers to make their smart contracts as **efficient as possible** so they pay the least fee possible. If someone writes very inefficient code, or, worst-case, an infinite loop in the smart contract, it may slow the network down temporarily, until the developer of the smart contract runs out Gas. This structure allows Solidity to use loops while keeping the blockchain running smoothly.

1. Ethereum Virtual Machines

EVM gets installed on your computer. The EVM completely encapsulates everything that runs on the blockchain and isolates it from the machine it’s running on. The EVM acts like a **computer within your computer**, and nothing can escape from the EVM onto your actual computer. In fact, EVMs are completely unaware of anything outside of it, which also adds to its several layers of security, guaranteeing that everything happening on the EVM, stays on the EVM.

### Benefits

1. remove intermediaries: remove the needs for intermediaries and allow direct and transparent relationships between all involved parties.
2. Efficiency: Smart contracts use software code to automate tedious tasks and related paperwork, thus saving time and money. This automation of tasks also helps avoid human error.
3. Security: documents are stored in encrypted form on an immutable ledger, they are highly secure with a low probability of misuse or tampering. Because the data is stored in chronological order, tracking the audit trail becomes very easy.
4. Decentralization: data is stored on all nodes on the network, even though one node goes down or fails, the other nodes can back it up.

### Limits

1. Immutable: As soon as a smart contract is put onto the blockchain, it cannot be changed. There is less flexibility in situations such as addressing a bug in a smart contract or a future need to change the code in the smart contract. The only way for you to change the code would be for you to add a new copy of the smart contract onto the blockchain.

[https://levelup.gitconnected.com/an-introduction-to-smart-contracts-c0b6c092028e](https://levelup.gitconnected.com/an-introduction-to-smart-contracts-c0b6c092028e)

[https://ethereum.org/en/developers/docs/intro-to-ethereum/](https://ethereum.org/en/developers/docs/intro-to-ethereum/)