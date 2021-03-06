pragma solidity ^0.4.24;

import "zeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";
import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "zeppelin-solidity/contracts/token/ERC20/CappedToken.sol";
import "zeppelin-solidity/contracts/token/ERC20/PausableToken.sol";
import "zeppelin-solidity/contracts/math/SafeMath.sol";

contract BEOToken is CappedToken,PausableToken,DetailedERC20 {
    using SafeERC20 for ERC20;
    using SafeMath for uint256;
    
    uint256 multiplier;
    constructor (
        uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol,
        uint256 _cap
    ) CappedToken(_cap*(10**uint256(_decimalUnits))) DetailedERC20(_tokenName,_tokenSymbol, _decimalUnits) public {
        multiplier = 10**(uint256(_decimalUnits));
        balances[owner] = _initialAmount*multiplier;         // Give the creator all initial tokens
        totalSupply_ = _initialAmount*multiplier;            // Update total supply
    }
}
