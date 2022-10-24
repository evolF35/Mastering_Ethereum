

pragma solidity 0.8.17;

contract Owned{
    address owner;

    constructor() {
        owner = msg.sender;
    }


    modifier onlyOwner {
        require(msg.sender == owner,"only owner");
        _;
    }
}


contract Mortal is Owned {

function destroy() public onlyOwner{
            selfdestruct(payable(owner));
}

}

contract Faucet is Mortal {

    event Withdrawal(address indexed to, uint amount);
    event Deposit(address indexed from, uint amount);

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }


    function withdraw(uint amount) public {

        require(amount <= .1 ether);
        require(address(this).balance >= amount, "insufficient" );
        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender, amount);

    }
}


