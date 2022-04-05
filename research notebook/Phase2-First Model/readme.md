# Phase2: Our First Model

## 2.1 Abstract

As discussed in phase 1, we are doing a bottom-up approach of carbon emission in the mining process. This approach will later embedded with a smart contract. In this phase, the first model is given, and I will walk you through how I get there.

The estimation is broken down to two parts: estimate electricity usage from the computation power cost and estimate carbon emission from the electricity usage. 

## 2.2 Computation Power —> Electricity Usage

### 2.2.1 Measurement of computation power: GAS

There is a good standing point of how much computation power that has been used in a ETH transaction: **GAS**. According to the ethereum documents, “*Gas refers to the unit that measures the amount of computational effort required to execute specific operations on the Ethereum network.*”([https://ethereum.org/en/developers/docs/gas/#what-is-gas](https://ethereum.org/en/developers/docs/gas/#what-is-gas)). Therefore, computation power usage of a transaction should be proportional to the gas usage in the transaction, assuming that under an average hardware situation.

### 2.2.2 Gas Vs. Receipt Gas

Luckily, gas usage of a transaction is recorded in the google bigQuery. 

![531649124328_.pic.jpg](Phase2%20Our%20ecea9/531649124328_.pic.jpg)

As shown above, there are two columns related to gas usage: “Gas” and “Receipt Gas Used”. **We will use “Receipt Gas Used” as the measurement of computation power.** This is because “Receipt Gas Used” represents the actual gas usage in a transaction.

Here is a short explanation. In ETH, gas usage is related to the block size. 

![Screen Shot 2022-04-04 at 10.58.23 PM.png](Phase2%20Our%20ecea9/Screen_Shot_2022-04-04_at_10.58.23_PM.png)

Generally, the bigger the block is, the more gas it will cost. The size of a block is changeable before it is finally added to the main net(a block can contain a simple transaction or a complicated smart contract, that’s why the size is not defined). A block will be assigned a standard size at first before deployment, i.e, the “Gas” in bigQuery. Then, depending on the actual transaction or smart contract it contained, the actual usage of gas will be stored in the “Receipted Gas Used” field in bigQuery.(see more detail explanation in: [https://ethereum.org/en/developers/docs/blocks/](https://ethereum.org/en/developers/docs/blocks/))

Selected “Receipt Gas Used” as a standing point, we have our first model of electricity usage.

![Screen Shot 2022-04-04 at 10.53.30 PM.png](Phase2%20Our%20ecea9/Screen_Shot_2022-04-04_at_10.53.30_PM.png)

where X denotes the gas consumed. 

> *(source: Saingre, D., Ledoux, T. & Menaud, JM. Measuring performances and footprint of blockchains with BCTMark: a case study on Ethereum smart contracts energy consumption. Cluster Comput
 (2021). https://doi.org/10.1007/s10586-021-03441-x)*
> 

**Ticker 1**: Given the same level of Gas, hardware difference influence the electricity usage a lot. For now, we ignore this difference, and it should be included in the future. 

see more discuss on CPU and electricity usage: [https://www.sciencedirect.com/science/article/pii/S0360544218322503](https://www.sciencedirect.com/science/article/pii/S0360544218322503)

Other articles I have read that may help: 

 1.  [https://ieeexplore.ieee.org/abstract/document/8530775](https://ieeexplore.ieee.org/abstract/document/8530775)

1. [https://www.research-collection.ethz.ch/bitstream/handle/20.500.11850/312914/TMeineOrdnerMaster-ArbeitenHS18Signer_Christopher.pdf](https://www.research-collection.ethz.ch/bitstream/handle/20.500.11850/312914/TMeineOrdnerMaster-ArbeitenHS18Signer_Christopher.pdf)

## 2.3 Electricity Usage —> CO2 Emission

The Power(X) function is really good for now. And for the carbon emission, we need an emission function. It is given below.

![Screen Shot 2022-04-04 at 11.02.10 PM.png](Phase2%20Our%20ecea9/Screen_Shot_2022-04-04_at_11.02.10_PM.png)

This is a general conceptual function set. Here we need an electricity-carbon factor.

Unfortunately. at this phase, we don’t have a factor that connects electricity usage and CO2 emission. So we just put this from twitter: 

![541649127648_.pic.jpg](Phase2%20Our%20ecea9/541649127648_.pic.jpg)

Boom! Electricity-carbon factor = 0.0004. Now we have our first working model!

## 2.4 Limit

After testing with some real transitions, the carbon emission derived from our first model is way smaller than the average emission in the reports discussed in phase 1. Here are limitations of our model: 

1. Ignored hardware difference
2. Power function is a linear regression model
3. Electricity-carbon factor is too simple and need more scientific source
