# sprint 5

## Research on Events and Logs in Smart Contracts

### What are events and logs?

Events and logs in smart contracts are important in smart contracts using to establish the communication between smart contracts and the user interfaces (front end).

### Difference between traditional web development?

- traditional: users initiate the call, server responds
- smart contract: when transaction mined, smart contracts emit events and write logs on the blockchain (documentation), then front end process.

### Why need it?

- We can understand events as the method that used to inform internal and external users that something new happen on the blockchain. Smart contracts themselves can not listen to any events.
- Actually information on the blockchain is all public and open. Actions can be found and explored by identifying and looking into the exact transactions, but event means creating a shortcut to know what happen.
- My understanding about events is that it is used to documents the important details that smart contract or developers care about and then encapsulate as ‘event’. For every time, the smart contract want to communicate with the front-end or other smart contracts, developers emit the event to trace the important details.
    - For example, if we care about transaction details, the event layout should include from_address, to_address, amount. When A sends a token to B, the transfer event will be triggered and include all the data about the transfer.

### How to use events?

1. declare events with the event keyword, including name of event and the parameters you want to save when trigger the event

```solidity
event event_name(address_from, address_to, amount)
```

1. Emit the event within function

```solidity
emit event_name()
```