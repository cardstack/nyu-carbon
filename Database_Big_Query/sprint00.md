# Sprint 0

# Data Exploration for Transaction Table

### What is the sum and avg of the gas used for one block

```sql
Select block_number, sum(receipt_gas_used) sum_gas_usedin_this_tr, avg(receipt_gas_used) avg_gas_usedin_this_tr
from `bigquery-public-data.ethereum_blockchain.transactions` tr
group by 1
order by 2 desc, 3 desc
limit 20
;
```

### What is the sum, avg gas paid on each block number

```sql
with t as (
Select block_number, (gas * gas_price) as sum_price_paid_block
from `bigquery-public-data.ethereum_blockchain.transactions` tr
limit 10) 

select block_number, avg(sum_price_paid_block) avg_price_paid_block from t
group by 1
```

# Data Exploration for Token_Transfer/Blocks Table

### -- number of unique token address in token_transfers

```sql
Select count(distinct tk_transfers.token_address) unique_token_address
FROM `bigquery-public-data.ethereum_blockchain.token_transfers` tk_transfers
;
```

### -- number of unique block used in token_transfer

```sql
Select count(distinct tk_transfers.block_number) uniqe_transfer_block_number
FROM `bigquery-public-data.ethereum_blockchain.token_transfers` tk_transfers
;
```

### -- total value, avg value in each block_number

```sql
Select block_number, sum(cast(value as FLOAT64)) sum_value_per_block, 
	avg(cast(value as FLOAT64)) avg_value_per_block
FROM `bigquery-public-data.ethereum_blockchain.token_transfers` tk_transfers
group by 1 
order by 2 desc, 3 desc
limit 10
;
```

### Calculate avg gas based on total count of transactions

```sql
select number, size, gas_used/transaction_count avg_gas_per_transaction
from `bigquery-public-data.ethereum_blockchain.blocks` br
limit 20
```