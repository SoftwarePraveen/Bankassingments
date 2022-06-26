

pragma solidity >=0.5.3 < 0.8.10;

contract bank{
    event depo(address account, uint amount);
    event with(address account, uint amount);
    mapping (address => uint) balance;

    function deposite(uint amount) public{
        require(amount > 0);
        balance[msg.sender] += amount;
        emit depo(msg.sender,amount);
    }
    function withdraw(uint amount) public{
        require(balance[msg.sender] > amount ,"Insufficient Balance or Can't withdraw whole money at once. ");
        balance[msg.sender]-= amount;
        emit with(msg.sender,amount);
    }
    function getbalance() public view returns(uint){
        return balance[msg.sender];

    }
}