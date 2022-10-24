

pragma solidity 0.6.4;

contract Faucet {
    receive() external payable {}

    function withdraw(uint amount) {
        require(amount <= 100000000000000000);

        msg.sender.transfer(withdraw_amount);
    }

}