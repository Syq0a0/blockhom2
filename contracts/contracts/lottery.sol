// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// Uncomment the line to use openzeppelin/ERC20
// You can use this dependency directly because it has been installed already
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./MyERC20.sol";

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Lottery {

    event ProposalInitiated(uint32 proposalIndex);

    struct Proposal {
        uint index;      // index of this proposal
        address proposer;  // who make this proposal
        int passnum;
        string name;       // proposal name
        string contents;   // 提案内容
        uint prostatus;   //状态 0否决 1同意 2进行中  
    }
    uint256 constant public PLAY_AMOUNT = 500;

    int256 public totalAmount; // 奖池总共金额
    address public manager; // 管理员，用来开奖和退款

    address[] public players; // 玩家

    address public winner; // 胜者
    MyERC20 public myERC20; // 彩票相关的代币合约

    modifier onlyManager {
        require(msg.sender == manager);
        _;
    }
    

    uint public proIndex;

   
    mapping(uint => Proposal) proposals; // A map from proposal index to proposal
    

    constructor() {
        proIndex=0;
        myERC20 = new MyERC20("ZJUToken", "ZJUTokenSymbol");
        manager = msg.sender;
    }

  // 获取参与者数量
    function getPlayerNumber() view external returns (uint256){
        return players.length;
    }

    function addProposal(string memory _name, string memory _contents)payable public{
       myERC20.transferFrom(msg.sender, address(this), PLAY_AMOUNT);
       // 参与者加入
       players.push(msg.sender);
       manager=msg.sender;
       totalAmount += 1;
       Proposal memory proposal1 = Proposal(proIndex,msg.sender,0,_name,_contents,2);
       proposals[proIndex] = proposal1;
       //proIndex += 1;
    }
    
    function vote(uint _proid, uint _result)payable public{
        myERC20.transferFrom(msg.sender, address(this), PLAY_AMOUNT);
       // 参与者加入
       players.push(msg.sender);
       
            if (_result==1){
                proposals[_proid].passnum += 1;
                totalAmount += 1;
            }
            else{
                proposals[_proid].passnum -= 1;
                totalAmount -= 1;
            }
    }

    function sum(uint _proid)payable public{
        
        if (proposals[_proid].passnum>0){
            proposals[_proid].prostatus = 1;
            
        }
        else{
            proposals[_proid].prostatus = 0;
        }
        delete players;
        totalAmount = 0;
    }

    
}
