# NFT Purge Smart Contract Design Doc

Author: @Runze Fang (fangrunze@outlook.com)

---

In this article, I will walk you through out smart contract. It’s design, functionalities, features and limits. 

### 1. Abstract

The goal of the smart contract is to enable our user to offset an amount of CO2 emission caused by the NFT transactions. Offsetting is approached by burning an amount of carbon credits. BCT token is selected as a the carbon credit because it’s scalability and easy use. In general, 1 BCT token = 1 kg of CO2 emission. (see: [https://toucan.earth/](https://toucan.earth/)) The amount of BCT burning is based on the carbon emission model I generated in the previous phases.

### 2. Design

![Screen Shot 2022-04-26 at 9.43.14 PM.png](NFT%20Purge%20Smart%20Contract%20Design%20Doc%20cdb4136fa41f44e987c60217f9da170e/Screen_Shot_2022-04-26_at_9.43.14_PM.png)

Imagine the process of a fund manager get money and from your wallet and do investment for you. The smart contract is like the fund manager: it takes the BCT token from user’s wallet and help them invest on carbon offset activity, namely burn the BCT token. As a proof of burning, our smart contract will record the successful offset activity and produce a carbon offset certification, just like the organic stamp on your milk bottles.

### 3. Functionality

![Screen Shot 2022-04-26 at 10.11.03 PM.png](NFT%20Purge%20Smart%20Contract%20Design%20Doc%20cdb4136fa41f44e987c60217f9da170e/Screen_Shot_2022-04-26_at_10.11.03_PM.png)

The smart contract contains three steps to accomplish the process discussed above: approval, transfer and burn. 

- Approval: user authorized the smart contract to take BCT token from their wallet, like Metamask
- Transfer: BCT token transfer from the user wallet to the smart contract
- Burn: The smart contract burn BCT tokens by sending them to the zero address (0x0000000000000000000000000000000000000000)

There is a virtual step during the process: lock the BCT token in the smart contract. This is due to the security concern. We do not want this crypto asset to be used other than be burnt.

### 4. Features

![Screen Shot 2022-04-26 at 9.47.05 PM.png](NFT%20Purge%20Smart%20Contract%20Design%20Doc%20cdb4136fa41f44e987c60217f9da170e/Screen_Shot_2022-04-26_at_9.47.05_PM.png)

Security features have been added into the smarted contract. In short, all validations and checks are applied to make sure that the burning process will be done successfully and completely without any interruption. We do not want to keep any BCT tokens in the smart contract.

State variables in solidity are introduced into the smart contract. Once the smart contract has finished a task, its state will change. The later tasks will validate the current state and if it is invalid, all previous transactions in this smart contract call will be reverted. State variables make sure the three tasks will be done accordingly and avoid re-done situation.

### 5. Limits

1. Stamping & green label
    
    The stamping function need further discussion. The main obstacle for having a stamping function is NFT’s changing carbon emission. The static smart contract cannot know the current carbon balance of an NFT. So the situation that one green-labeled NFT is not carbon neutral may happen because it was carbon neutral at the time of stamping but later it has new transactions. 
    
    There might be 2 ways of solving this issue. One is embedded the green label with token standard like ERC-721. So that once the transaction happen, the NFT will be re-evaluated of carbon neutral. The other possible way is to combine the green label with time stamps. Therefore, an NFT is “green” in the latest block. 
    
    I’m excited if we can really solve this and email me if you have more ideas.
    
2. Intermediary fee
    
    Our smart contract is free and for voluntary use. It shows the possibility and potential of a green NFT marketplace. We did not think deeply of its commercialization possibility. If it is used for the business purpose, it should be re-designed and introduced an intermediary fee system.
