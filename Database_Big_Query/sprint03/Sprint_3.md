# Sprint 3

## Update Emission Calculation

```sql
with t as (
select tk_tr.value token_id, tr.block_timestamp, 
		tk_tr.block_timestamp, receipt_gas_used 
FROM `bigquery-public-data.crypto_ethereum.transactions` tr 
	join `bigquery-public-data.crypto_ethereum.token_transfers` tk_tr 
    on tr.`hash` = tk_tr.transaction_hash
where tr.to_address = lower('0x1a92f7381b9f03921564a437210bb9396471050c')) 

select distinct token_id, accumulative_gas_fee, 
	(accumulative_gas_fee * 0.0000036756792144 + 66.1136) * 1.004 * 0.475 / 0.0005 / 1000 watt_per_token
from 
(
select token_id, 
sum(receipt_gas_used) over(partition by token_id) accumulative_gas_fee from t
) t2 
order by 1
```

![Untitled](imgs/Untitled.png)

## Use Polygon to set up Smart Contract

```solidity
// Specifies that the source code is for a version
// of Solidity greater than 0.5.10
pragma solidity ^0.5.10;

// A contract is a collection of functions and data (its state)
// that resides at a specific address on the Ethereum blockchain.
contract HelloWorld {

    // The keyword "public" makes variables accessible from outside a contract
    // and creates a function that other contracts or SDKs can call to access the value
    string public message;

    // A special function only run during the creation of the contract
    constructor(string memory initMessage) public {
        // Takes a string value and stores the value in the memory data storage area,
        // setting `message` to that value
        message = initMessage;
    }

    // A publicly accessible function that takes a string as a parameter
    // and updates `message`
    function update(string memory newMessage) public {
        message = newMessage;
    }
-- follow tutorial on Polygon
```

![Untitled](imgs/Untitled%201.png)