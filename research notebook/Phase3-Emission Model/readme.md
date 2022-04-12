# Phase 3: Model V3

## 3.1 Abstract

In this phase, we continue working on the emission model. A reminder of what we have now: 

1. a solid Power(gas) function:

$$
 Power(gas) = gas ∗ 3.67e-6 + 66.12 (unit: Watts)
$$

1. a good conceptual Emission model: 

$$
Emission(PoS) = Power(gas) ∗ Tx time(in hours) ∗ electricity-carbon factor (unit: KG of CO2)
$$

The electricity-carbon factor we used in Phase 2 came form twitter, which is constant, and the Tx time is an average number. The electricity-carbon factor and the Tx time vary from transaction to transition due to the difference in electricity source(coal, solar, tide, nuclear), energy transmission efficiency and region of the miner. Therefore, we try to replace these two constant factors with more precise predictions for each transaction.

## 3.2 Tx time

### 3.2.1 Definition

The ETH community @Etherscan provide API for transaction time:[https://docs.etherscan.io/api-endpoints/gas-tracker#get-estimation-of-confirmation-time](https://docs.etherscan.io/api-endpoints/gas-tracker#get-estimation-of-confirmation-time)

The API returns the estimated time, in seconds, for a transaction to be confirmed on the blockchain. If the transaction has been complete, it returns the transaction time usage.

### 3.2.2 Implementation

Unfortunately, the Etherscan API is not open source and free (free account can only call the API 5 times per second). At this stage, we don’t have the resources to afford the Etherscan cost. Therefore, we use the json response we get from the test call of the Etherscan API: **1.004hr** as the average transaction time.

## 3.3 Electricity-carbon Factor

### 3.3.1 Definition

Unlike the transaction time, the electricity carbon factor is complicate. It is related to the region of the miner. In general, transactions from miners in fossil-fuel power dominant countries will have a higher electricity factor, for example, miners from China. Regulation is another impactor of the electricity-carbon factor. For example, Chinese government announced a regulation of mining activity in Sep. 2021, which led to a huge drop in Chinese computation power from 60% to 20% over the global computation power. This indicates miners were escaping from China and consequently, the electricity-carbon factor of them was not the same any more.

Due to the complexity, we normalize the issue to estimate the average electricity-carbon factor in the ETH community.

### 3.3.2 **Crypto Carbon Ratings Institute (**CCRI)

CCRI is a research-driven company providing carbon estimates for investments in cryptocurrencies and technologies such as Blockchain and DLT. It provides yearly crypto currency carbon report and APIs also.

CCRI provides two useful APIs: **daily carbon emissions** and **daily electricity consumption** of a specific crypto currency, in our case, the ETH. Thus, the average daily electricity-carbon factor can be written as the form below:

![Screen Shot 2022-04-09 at 4.01.25 PM.png](Phase%203%20Mo%20e8bc3/Screen_Shot_2022-04-09_at_4.01.25_PM.png)

### 3.3.3 APIs

Let’s take a deep look of the APIs.

API link: [https://v1.api.carbon-ratings.com/documentation#/](https://v1.api.carbon-ratings.com/documentation#/)

Documentation: [https://docs.api.carbon-ratings.com/#/](https://docs.api.carbon-ratings.com/#/)

**daily carbon emissions:**

![Screen Shot 2022-04-09 at 3.59.39 PM.png](Phase%203%20Mo%20e8bc3/Screen_Shot_2022-04-09_at_3.59.39_PM.png)

**daily electricity consumption:**

![Screen Shot 2022-04-09 at 4.00.01 PM.png](Phase%203%20Mo%20e8bc3/Screen_Shot_2022-04-09_at_4.00.01_PM.png)

As shown in the graphed above, these two APIs will give us a json response of daily carbon emission in ETH community (in tonnes) and daily electricity consumption in ETH community (in kWH).

### 3.3.4 Implementation

Unfortunately, the CCRI APIs are under construction and it is not open source. At this stage, I read through the ****CCRI-PoS-Report-2022**** (check this out in the repo: [https://github.com/cardstack/nyu-carbon/blob/main/research notebook/CCRI-PoS-Report-2022.pdf](https://github.com/cardstack/nyu-carbon/blob/main/research%20notebook/CCRI-PoS-Report-2022.pdf)), and uses the data from it to make our model functional. According to the report, we used **0.475 kgCO2/kWH** as our electricity-carbon factor.

## 3.4 Limit

1. Not support PoW model. For now, the model did not take the energy consumption unsuccessful miners in  transactions into account. We will try to solve this in the next phase.
2. No actual usable APIs.
3. The CCRI estimation of electricity consumption and carbon emission is still vague and average number which does not take hardware and regional differences into account.
