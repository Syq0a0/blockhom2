# 去中心化学生社团组织治理应用
 
> - 每个学生初始可以拥有或领取一些通证积分（ERC20）。 
> - 每个学生可以在应用中可以： 
>    1. 使用一定数量通证积分，发起关于该社团进行活动或制定规则的提案（Proposal）。 
>    2. 提案发起后一定支出时间内，使用一定数量通证积分可以对提案进行投票（赞成或反对，限制投票次数），投票行为被记录到区块链上。 
>    3. 提案投票时间截止后，赞成数大于反对数的提案通过，提案发起者作为贡献者可以领取一定的积分奖励。 
> 
> - (Bonus）发起提案并通过3次的学生，可以领取社团颁发的纪念品（ERC721）

## 简要说明
本程序的整体代码框架fork了助教提供的浙大彩票demo，保留了demo中的MYERC20合约，并完全修改了Lottery合约的内容，前端页面样式和逻辑也根据需求在demo基础上进行了一定的修改。对于要求的功能，整体上能够做到简单实现，对于不正确的操作有合理的报错机制。


## 如何运行

1. 在本地启动ganache应用。

2. 在 `./contracts` 中安装需要的依赖，运行如下的命令：
    ```bash
    npm init --yes
    npm install
    ```
3. 在 `./contracts` 中编译合约，运行如下的命令：
    ```bash
    npx hardhat compile
    ```
4. 修改hardhat.config.ts中的账户私钥，在 `./contracts` 中部署合约，运行如下的命令，得到合约地址：
    ```bash
    npx hardhat run ./scripts/deploy.ts --network ganache
    ```
5. 将编译合约生成的ABI文件复制到`./frontend/src/utils/abis`，将`./frontend/src/utils/contract-addressesabis.json`中的地址改为部署合约的地址
6. 在 `./frontend` 中安装需要的依赖，运行如下的命令：
    ```bash
    npm install -D web3
    ```
7. 在 `./frontend` 中启动前端程序，运行如下的命令：
    ```bash
    npm run start
    ```

## 功能实现分析
项目完成了以下功能
1. 领取通证积分，每个用户仅限一次
该功能与领取浙大币空投一致，通过调用MyERC20合约中的airdrop函数即可实现
2. 使用一定数量通证积分，发起提案
使用积分与彩票demo中注入奖池一致，使用相同方法实现，在此基础上，调用Lottery合约中的addProposal函数，发起一个提案
![avatar](/pictures/1.png)
3. 使用一定数量通证积分可以对提案进行投票
使用积分实现同上，调用Lottery合约中的vote函数，用户可实现投票
![avatar](/pictures/2.png)
4. 提案截止后，赞成数大于反对数的提案通过，提案发起者领取一定的积分奖励
调用Lottery合约中的sum函数，发起者可以结束提案，获得积分奖励可根据demo中空投函数进行修改得到
![avatar](/pictures/3.png)
![avatar](/pictures/4.png)

## 项目运行截图
1. 启动ganache链
![avatar](/pictures/5.png)
2. 启动前端页面
![avatar](/pictures/16.png)
![avatar](/pictures/6.png)
3. 导入账户
![avatar](/pictures/7.png)
4. 领取通证积分（刷新页面后积分数目正确显示）
![avatar](/pictures/8.png)
5. 发起提案（成功发起，提案发起者地址变为当前用户地址，提案支持人数变为1）
![avatar](/pictures/9.png)
![avatar](/pictures/10.png)
6. 切换用户并同意提案
![avatar](/pictures/11.png)
7. 切换用户并拒绝提案
![avatar](/pictures/12.png)
8. 切换回发起者并统计提案(支持人数-反对人数>0，提案通过)
![avatar](/pictures/13.png)
9. 发起者获得通证积分奖励
![avatar](/pictures/14.png)
10. 过程产生大量新的区块
![avatar](/pictures/15.png)


## 参考内容

课程的参考Demo见：[DEMOs](https://github.com/LBruyne/blockchain-course-demos)。

