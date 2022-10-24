pragma solidity ^0.4.24;

import '../node_modules/openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol';


contract METoken is StandardToken {

    string public constant name = 'Mastering Ethereum Token';
    string public constant symbol = 'MET';
    uint8 public constant decimals = 2;
    uint constant _initial_supply = 21000000;

    function METoken() public {
        totalSupply_ = _initial_supply;
        balances[msg.sender] = _initial_supply;
        emit Transfer(address(0), msg.sender, _initial_supply);
    }

}