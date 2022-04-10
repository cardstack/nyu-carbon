# Phase 1: Project Definition

Crypto currency transaction is costly. See: https://postergrind.com/how-much-energy-does-it-take-to-make-an-nft/?utm_source=rss&utm_medium=rss&utm_campaign=how-much-energy-does-it-take-to-make-an-nft
In this phase, I will try to define the emission source, go over existing researches and define our scope.

## 1.1 Emission Source

As shown in the graph below, there are three sources during a transaction of crypto currency: verification, mining, propagation.

![bitcoin-transaction-infographic-medium.png](Phase%201%20Pr%20051f8/bitcoin-transaction-infographic-medium.png)

- **Verification**: after initiating a transaction, the transaction info will be propagated and validated by the network nodes.
- **Mining**: Miner’s will solve the puzzles in the block, and then try to put then block on chain. This process will consuming huge computational power and then large carbon emission. Under PoS model, for each transaction, there will be countless miner trying to solve the puzzle and the same time and the first one who put the block on chain and propagating this to the entire network will success and get the reward. Therefore, the more energy would be consumed.
- **Propagation**: every time transaction is validated and put into the network, the transaction info will be propagated to the entire network once. This will have a increasing energy cost when there are increasing number of transactions.

The emission from mining consist of >98% energy consumption in crypto transactions. Therefore, our model will mainly focus on estimating the carbon emission from the mining activity in crypto transactions.

![Screen Shot 2022-03-24 at 8.40.33 PM.png](Phase%201%20Pr%20051f8/Screen_Shot_2022-03-24_at_8.40.33_PM.png)

---

## 1.2 Existing Emission Modeling

There are existing works of modeling carbon emission of crypto mining. All of them estimated the emission of the entire ETH activity. None of them focuses on the emission of each transaction.

**Carbon Emission in ETH community**

The following graph walks you through steps of modeling ETH emission: 

**ETH electricity —> ETH carbon emission**

![Screen Shot 2022-03-24 at 8.39.51 PM.png](Phase%201%20Pr%20051f8/Screen_Shot_2022-03-24_at_8.39.51_PM.png)

The following formula is used to calculate the electricity power usage of ETH community

![Screen Shot 2022-03-24 at 8.43.21 PM.png](Phase%201%20Pr%20051f8/Screen_Shot_2022-03-24_at_8.43.21_PM.png)

source:

1. [https://github.com/kylemcdonald/ethereum-emissions/blob/main/McDonald-Ethereum-Emissions.pdf](https://github.com/kylemcdonald/ethereum-emissions/blob/main/McDonald-Ethereum-Emissions.pdf)
2. [https://ethereum.github.io/yellowpaper/paper.pdf](https://ethereum.github.io/yellowpaper/paper.pdf)
3. [https://www.notion.so/Carbon-FYI-Methodology-51e2d8c41d1c4963970a143b8629f5f9](https://www.notion.so/Carbon-FYI-Methodology-51e2d8c41d1c4963970a143b8629f5f9)

---

**The ETH Emission Model Demo**

Mr. Kyle Mcdonald’s website: [https://kylemcdonald.github.io/ethereum-emissions/](https://kylemcdonald.github.io/ethereum-emissions/), realize the model discussed above and provide us a real-time bottom-up estimation of ETH emissions:

In short, the yearly energy cost of ETH transaction is 7 times than the usage of entire Google company or the yearly electricity usage of Washington State. Pretty huge huh?

![Screen Shot 2022-03-24 at 8.49.14 PM.png](Phase%201%20Pr%20051f8/Screen_Shot_2022-03-24_at_8.49.14_PM.png)

---

## 1.3 Our vision

Unlike the model shown above, our goal is to provide the user carbon emission for each ETH transaction (presumably real-time estimation), rather than an average of the entire ETH community. Thus, users can know how much CO2 the incoming transaction will cost and the previous transaction have cost, and then decide the offset amount.

Our model’s accuracy will be tested by the following steps:

1. Provide a model for estimating carbon emission of one transaction
2. Compute the overall carbon emission in ETH community
3. Compare our result with Mr. Kyle Mcdonald’s estimation
