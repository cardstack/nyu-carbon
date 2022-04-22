# Phase 4: Model for PoW and Model Review

Autor: @Runze Fang, fangrunze@outlook.com

### 4.1 Abstract

In the past three phases, I complete a functional carbon emission model for ETH transactions under the PoS model, in which I assumed the carbon emission of the transaction came from only one miner. Although ETH is scheduled to shift to PoW model before June, 2022, I still need a PoS approach for the project scalability need.

In phase 4, I will adjust our existing model for the PoW framework. The I will do an overall analysis of our final model: verify the model accuracy and recap the limits(tickers) in it for the future modification use.

### 4.2 PoW Vs. PoS

Both of PoW and PoS are consensus mechanisms for securing the block chain transaction: mainly prevent the double-spending issue and 51% attack. They have their pros and cons. I will discuss them shortly here.

**PoW**: Proof of Work model is the dominant model in today ‘s main net, it has a simple but efficient conceptual model for implementation. In short, PoW mechanism is like a mining race. Before a block is actually appended to the main chain, it will be mined by multiple miners. “Mining” here refers to the process that a lot of miners solving the same mathematical puzzle contained in the block at the same time. The first miner who solves the puzzle will have append the block to the chain and get his rewards. Only the first miner will get the rewards, which means every resources that other miners spent are useless. As you can see, one side effect of PoW mechanism is that the repeating work done by the miners are a huge waste of computational power and energy. 

See more in [https://ethereum.org/en/developers/docs/consensus-mechanisms/pow/](https://ethereum.org/en/developers/docs/consensus-mechanisms/pow/)

**PoS**: Proof of Stake is an approach that people try to solve the energy issue in the PoW system. In short, only one miner will have the right to solve the puzzle and append the block on chain. The miner is selected from a pool of miners who have staked an a mount of ETH. No energy waste this time.

See more in [https://ethereum.org/en/developers/docs/consensus-mechanisms/pos](https://ethereum.org/en/developers/docs/consensus-mechanisms/pos)

### 4.3 Final Model

It is hard to estimate the number of unsuccessful miners in a transaction inPoW system. Thus, I use the overall energy saving of PoS to reverse-estimate the energy cost of PoW.

According to Ethereum official documentation, once shifting to PoS mechanism, ETH will save 99.95% energy. 

*source:*

1.  [https://blog.ethereum.org/2021/05/18/country-power-no-more/](https://blog.ethereum.org/2021/05/18/country-power-no-more/)
2. [https://digiconomist.net/ethereum-energy-consumption/](https://digiconomist.net/ethereum-energy-consumption/)

Therefore, I can expand our model from PoS to PoW by putting these percentage back as follows: 

![Screen Shot 2022-04-20 at 4.40.14 PM.png](Phase%204%20Model%20for%20PoW%20and%20Model%20Review%2098eade6110c5445b9c413ace145f4563/Screen_Shot_2022-04-20_at_4.40.14_PM.png)

### 4.4 Performance

After doing some test on the transaction data from Big Query, I have an average 65 kg of CO2 emission per transaction. In general, it is a reasonable number.

The average number of CO2 emission per transaction is close to other researcher’s model. Here are some of the researches:

1. Post Grind: “Minting an NFT cost 83 KG of CO2 and ownership cost 30 KG of CO2”. *source:* [https://postergrind.com/how-much-energy-does-it-take-to-make-an-nft/?utm_source=rss&utm_medium=rss&utm_campaign=how-much-energy-does-it-take-to-make-an-nft](https://postergrind.com/how-much-energy-does-it-take-to-make-an-nft/?utm_source=rss&utm_medium=rss&utm_campaign=how-much-energy-does-it-take-to-make-an-nft)
2. Crypto art ([https://cryptoart.wtf/#list=nfts](https://cryptoart.wtf/#list=nfts)): crypto art did some modeling of different NFT marketplaces. *source*: [h](https://cryptoart.wtf/#list=nfts)[ttps://github.com/kylemcdonald/ethereum-nft-activity](https://github.com/kylemcdonald/ethereum-nft-activity)

[Emissions, as of March 5, 2022](https://www.notion.so/690ce5cd64d34091aa403176ed9fdbd7)

1. UCL: our model have a pretty close electricity consumption as the UCL research modeled. *source*: [http://blockchain.cs.ucl.ac.uk/wp-content/uploads/2021/11/UCL_CBT_DPS_Q32021_updated-2.pdf](http://blockchain.cs.ucl.ac.uk/wp-content/uploads/2021/11/UCL_CBT_DPS_Q32021_updated-2.pdf)

![Screen Shot 2022-04-20 at 5.10.14 PM.png](Phase%204%20Model%20for%20PoW%20and%20Model%20Review%2098eade6110c5445b9c413ace145f4563/Screen_Shot_2022-04-20_at_5.10.14_PM.png)

### 4.5 Model review: Limits

The emission model is functional and ready to be implemented at this stage. It has a huge potential to be improved. I will record all the tickers here for future use.

### 4.5.1 Power(Gas) function

The Power(Gas) function is a statice linear regression, while crypto transactions varies all the time. Three potentials of this function: 

1. update the regression dynamically using the latest transaction data
2. try other regression models
3. try a bottom-up estimation of the electricity usage, this article may be a starting point : [https://ethereum.github.io/yellowpaper/paper.pdf](https://ethereum.github.io/yellowpaper/paper.pdf)

### 4.5.2 Carbon-electricity factor

The model relies on CCRI’s API, which is not functional yet. Owe own approach can be done based on the following resources:

1. [https://iea.blob.core.windows.net/assets/4bcf492f-f973-4b80-a5c1-f1c7c45f13d7/IEA_Energy_and_Carbon_Tracker_-_Users_guide_-_PDF.pdf](https://iea.blob.core.windows.net/assets/4bcf492f-f973-4b80-a5c1-f1c7c45f13d7/IEA_Energy_and_Carbon_Tracker_-_Users_guide_-_PDF.pdf)
2. [https://www.iea.org/](https://www.iea.org/)

### 4.5.3 PoS-PoW factor

The PoS-PoW factor is the biggest uncertain part in the current model. One possible way to tackle this issue is embedded the carbon counts into the ETH main framework, so that the number of validator can be easily accessed. The other way is to estimate the current number of validators in the main net based on the past transaction data. Both ways need more resource and efforts.
