// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "@pythnetwork/entropy-sdk-solidity/IEntropy.sol";
import "@pythnetwork/entropy-sdk-solidity/IEntropyConsumer.sol";
 
abstract contract CoinFlip is IEntropyConsumer {
  event FlipRequested(uint64 sequenceNumber);
  event FlipResult(uint64 sequenceNumber, bool isHeads);
 
  IEntropy entropy;
  address provider;
 
  constructor(address _entropy, address _provider) {
    entropy = IEntropy(_entropy);
    provider = _provider;
  }
 
  // This method is required by the IEntropyConsumer interface
  function getEntropy() internal view override returns (address) {
    return address(entropy);
  }
}
 