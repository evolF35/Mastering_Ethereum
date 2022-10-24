

pragma solidity 0.8.17;

contract Faucet {
    receive() external payable {}

    function withdraw(uint amount) public {
        require(amount <= 100000000000000000);

    payable(msg.sender).transfer(amount);

    }
}