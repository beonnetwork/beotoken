const BEOTokenFactory = artifacts.require('BEOTokenFactory.sol')

module.exports = deployer => {
  // const args = process.argv.slice()
  // let _initialAmount = 1000000000;
  // let _tokenName = "BeOn";
  // let _decimalUnits = 18;
  // let _tokenSymbol = "BEO";
  // let _cap = 1000000000;
  // deployer.deploy(BEOToken, _initialAmount, _tokenName, _decimalUnits, _tokenSymbol, _cap);
  deployer.deploy(BEOTokenFactory);
}