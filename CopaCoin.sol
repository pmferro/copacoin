pragma solidity ^0.4.4;

import "./ERC20Basic.sol";
import "./Ownable.sol";

contract CopaCoin is ERC20Basic, Ownable {
    mapping(address => uint256) balances;
    
    function mint(address _to, uint256 _amount) public onlyOwner {
        totalSupply += _amount;
        balances[_to] += _amount;
    }
    
    function mintOne(address _to) public onlyOwner {
        mint(_to, 1);
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender] - (_value);
        balances[_to] = balances[_to] + _value;
        Transfer(msg.sender, _to, _value);
        return true;
    }
    
    function spend(uint256 _amount) public returns(bool) {
        return transfer(owner, _amount);
    }

    function balanceOf(address _owner) public constant returns (uint256 balance) {
        return balances[_owner];
    }
}