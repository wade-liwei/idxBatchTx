# nameservice
**nameservice** is a blockchain built using Cosmos SDK and Tendermint and created with [Starport](https://github.com/tendermint/starport).

## Get started

```
starport chain serve
```

`serve` command installs dependencies, builds, initializes, and starts your blockchain in development.

### Configure

Your blockchain in development can be configured with `config.yml`. To learn more, see the [Starport docs](https://docs.starport.network).

### Launch

To launch your blockchain live on multiple nodes, use `starport network` commands. Learn more about [Starport Network](https://github.com/tendermint/spn).

### Web Frontend

Starport has scaffolded a Vue.js-based web app in the `vue` directory. Run the following commands to install dependencies and start the app:

```
cd vue
npm install
npm run serve
```

The frontend app is built using the `@starport/vue` and `@starport/vuex` packages. For details, see the [monorepo for Starport front-end development](https://github.com/tendermint/vue).

## Release
To release a new version of your blockchain, create and push a new tag with `v` prefix. A new draft release with the configured targets will be created.

```
git tag v0.1
git push origin v0.1
```

After a draft release is created, make your final changes from the release page and publish it.

### Install
To install the latest version of your blockchain node's binary, execute the following command on your machine:

```
curl https://get.starport.network/cosmonaut/nameservice@latest! | sudo bash
```
`cosmonaut/nameservice` should match the `username` and `repo_name` of the Github repository to which the source code was pushed. Learn more about [the install process](https://github.com/allinbits/starport-installer).

## Learn more

- [Starport](https://github.com/tendermint/starport)
- [Starport Docs](https://docs.starport.network)
- [Cosmos SDK documentation](https://docs.cosmos.network)
- [Cosmos SDK Tutorials](https://tutorials.cosmos.network)
- [Discord](https://discord.gg/cosmosnetwork)


## test result 

- 节点数    5
- 出块时间  10s
- md5数量  5000
- 交易数量  1000 
- 第一笔交易nonce  5230
- 最后一遍交易nonce 6229
- 发送开始时间 2021-12-10 03:40:45
- 发送结束时间 2021-12-10 03:43:34


|  序号   |  区块高度 | 区块时间  | 交易数量 |
| :----: | :------: | :-----:  | :----: | 
| 1      |  5841    |40:10     |  0     |  
| 2      |  5842    |40:20     |  0     |  
| 3      |  5843    |40:30     |  0     |  
| 4      |  5844    |40:41     |  38    |        
| 5      |  5845    |40:52     |  64    |   
| 6      |  5846    |41:05     |  129   |        
| 7      |  5847    |41:59     |  129   |   
| 8      |  5848    |42:58     |  129   |        
| 9      |  5849    |43:39     |  129   |   
| 10     |  5850    |44:24     |  129   |        
| 11     |  5851    |45:05     |  129   |   
| 12     |  5852    |45:49     |  124   |
| 13     |  5853    |46:20     |  0     |    
| 14     |  5854    |46:31     |  0     |    
| 15     |  5855    |46:42     |  0     |    
  


- 节点数   5
- 出块时间 10s
- md5数量  1000
- 交易数量 1000
- 第一笔交易nonce  6230
- 最后一遍交易nonce 7229
- 发送开始时间 2021-12-10 05:58:39
- 发送结束时间 2021-12-10 06:01:21


|  序号   |  区块高度 | 区块时间  | 交易数量 |
| :----: | :------: | :-----:  | :----: | 
| 1      |  6618    |58:04     |  0     |  
| 2      |  6619    |58:15     |  0     |  
| 3      |  6620    |58:25     |  0     |  
| 4      |  6621    |58:35     |  59    |        
| 5      |  6622    |58:46     |  76    |   
| 6      |  6623    |58:57     |  65    |        
| 7      |  6624    |59:09     |  69    |   
| 8      |  6625    |59:20     |  110   |        
| 9      |  6626    |59:37     |  58    |   
| 10     |  6627    |59:49     |  76    |        
| 11     |  6628    |00:01     |  64    |   
| 12     |  6629    |00:12     |  109   |
| 13     |  6630    |00:31     |  65    |    
| 14     |  6631    |00:42     |  70    |    
| 15     |  6632    |00:54     |  67    |    
| 16     |  6633    |01:06     |  112   |    
| 17     |  6634    |01:24     |  0     |
| 18     |  6635    |01:35     |  0     |   



- 节点数      5
- 出块时间    5s
- md5数量    1000
- 交易数量    1000
- 第一笔交易nonce  0
- 最后一遍交易nonce 999
- 发送开始时间 2021-12-10 06:36:41
- 发送结束时间 2021-12-10 06:38:57



|  序号   |  区块高度 | 区块时间  | 交易数量 |
| :----: | :------: | :-----:  | :----: | 
| 1      |  1     |35:07     |  0     |  
| 2      |  2     |36:32     |  0     |  
| 3      |  3     |36:38     |  19    |  
| 4      |  4     |36:43     |  55    |        
| 5      |  5     |36:50     |  54    |   
| 6      |  6     |36:57     |  56    |        
| 7      |  7     |37:05     |  41    |   
| 8      |  8     |37:10     |  52    |        
| 9      |  9     |37:17     |  53    |   
| 10     |  10    |37:24     |  41    |        
| 11     |  11    |37:30     |  40    |   
| 12     |  12    |37:35     |  41    |
| 13     |  13    |37:41     |  39    |    
| 14     |  14    |37:46     |  40    |    
| 15     |  15    |37:52     |  40    |    
| 16     |  16    |37:58     |  39    |    
| 17     |  17    |38:03     |  41    |
| 18     |  18    |38:09     |  43    |
| 19     |  19    |38:15     |  40    |        
| 20     |  20    |38:21     |  43    |   
| 21     |  21    |38:26     |  39    |
| 22     |  22    |38:32     |  47    |    
| 23     |  23    |38:39     |  43    |    
| 24     |  24    |38:45     |  44    |    
| 25     |  25    |38:51     |  43    |    
| 26     |  26    |38:56     |  7     |
| 27     |  27    |39:02     |  0     |
| 28     |  28    |39:07     |  0     |




- 节点数      5
- 出块时间    5s
- md5数量    5000
- 交易数量    1000
- 第一笔交易nonce  1000
- 最后一遍交易nonce 1999
- 发送开始时间 2021-12-10 06:55:43
- 发送结束时间 2021-12-10 06:58:38


|  序号   |  区块高度 | 区块时间  | 交易数量 |
| :----: | :------: | :-----:  | :----: | 
| 1      |  210     |55:20     |  0     |  
| 2      |  211     |55:25     |  0     |  
| 3      |  212     |55:30     |  0     |  
| 4      |  213     |55:36     |  0     |        
| 5      |  214     |55:41     |  21    |   
| 6      |  215     |55:47     |  37    |        
| 7      |  216     |55:54     |  34    |   
| 8      |  217     |56:02     |  88    |        
| 9      |  218     |56:17     |  129   |   
| 10     |  219     |56:54     |  129   |        
| 11     |  220     |57:38     |  129   |   
| 12     |  221     |58:17     |  129   |
| 13     |  222     |58:50     |  129   |    
| 14     |  223     |59:24     |  129   |    
| 15     |  224     |59:58     |  46    |    
| 16     |  225     |00:21     |  0     |    
| 17     |  226     |00:26     |  0     |    
| 18     |  227     |00:32     |  0     |    




- 节点数      5
- 出块时间    1s
- md5数量    1000
- 交易数量    100
- 第一笔交易nonce  0
- 最后一遍交易nonce 99
- 发送开始时间 2021-12-10 07:16:06
- 发送结束时间 2021-12-10 07:16:19


|  序号   |  区块高度 | 区块时间  | 交易数量 |
| :----: | :------: | :-----:  | :----: | 
| 1      |  50     |16:03     |  0     |  
| 1      |  51     |16:05     |  0     |  
| 2      |  52     |16:06     |  10     |  
| 3      |  53     |16:07     |  10   |  
| 4      |  54     |16:09     |  11    |        
| 5      |  55     |16:10     |  11    |   
| 6      |  56     |16:12     |  10    |        
| 7      |  57     |16:13     |  11    |   
| 8      |  58     |16:14     |  10    |        
| 9      |  59     |16:16     |  15    |   
| 10     |  60     |16:18     |  10    |        
| 11     |  61     |16:19     |  2    |   
| 12     |  62     |16:20     |  0    |
| 13     |  63     |16:22     |  0    |  




- 节点数      5
- 出块时间    1s
- md5数量    5000
- 交易数量    500
- 第一笔交易nonce  140
- 最后一遍交易nonce 639
- 发送开始时间  2021-12-10 07:25:59
- 发送结束时间  2021-12-10 07:27:36


|  序号   |  区块高度 | 区块时间  | 交易数量 |
| :----: | :------: | :-----:  | :----: | 
| 1      |  496     |25:56     |  0     |  
| 2      |  497     |25:57     |  0     |  
| 3      |  498     |25:58     |  1     |  
| 4      |  499     |26:00     |  1     |   
| 5      |  500     |26:01     |  9     |        
| 6      |  501     |26:03     |  10    |   
| 7      |  502     |26:05     |  7     |        
| 8      |  503     |26:06     |   9    |   
| 9      |  504     |26:08     |   8    |        
| 10     |  505     |26:10     |  11    |   
| 11     |  506     |26:12     |   9    |        
| 12     |  507     |26:13     |   6    |   
| 13     |  508     |26:15     |  14    |
| 14     |  509     |26:17     |  13    |  
| 15     |  510     |26:20     |  11    |
| 16     |  511     |26:22     |  9     |  
| 17     |  512     |26:24     |  9     |
| 18     |  513     |26:27     |  18    |  
| 19     |  514     |26:30     |  12    |  
| 20     |  515     |26:32     |  10    |
| 21     |  516     |26:36     | 19     |  
| 22     |  517     |26:39     |  14    |  
| 23     |  518     |26:43     |  48    |  
| 24     |  519     |26:52     |  22    |  
| 25     |  520     |26:56     |  16    |        
| 26     |  521     |27:02     |  61    |   
| 27     |  522     |27:11     |  99    |        
| 28     |  523     |27:29     |  48    |   
| 29     |  524     |27:47     |   0    |  
| 30     |  525     |27:50     |   0    |  
| 21     |  526     |27:52     |   0    |  
| 32     |  527     |27:53     |   0    |    

