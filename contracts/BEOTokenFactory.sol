pragma solidity ^0.4.24;
import "./Factory.sol";
import "./BEOToken.sol";
import "zeppelin-solidity/contracts/math/SafeMath.sol";
import "zeppelin-solidity/contracts/token/ERC20/SafeERC20.sol";

contract BEOTokenFactory is Factory {
    using SafeMath for uint256;
    using SafeERC20 for BEOToken;

    function create(uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol,
        uint256 _cap)
        public
        returns (address tokenAddress)
    {
        BEOToken token = new BEOToken(_initialAmount, _tokenName, _decimalUnits, _tokenSymbol, _cap);
        uint256 multiplier = 10**(uint256(_decimalUnits));
        token.safeTransfer(msg.sender, _initialAmount*multiplier);
        token.transferOwnership(msg.sender);
        tokenAddress = address(token);
        register(tokenAddress);
    }

}
