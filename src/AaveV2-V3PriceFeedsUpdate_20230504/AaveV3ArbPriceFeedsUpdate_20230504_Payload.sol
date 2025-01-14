// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import {AaveV3ArbitrumAssets} from 'aave-address-book/AaveV3Arbitrum.sol';
import {AaveV3PayloadArbitrum, IEngine} from 'aave-helpers/v3-config-engine/AaveV3PayloadArbitrum.sol';

/**
 * @title wstETH Price Feed update
 * @author BGD Labs
 * @notice Change wstETH price feed on the Aave Arbitrum v3 pool.
 * - Governance Forum Post: https://governance.aave.com/t/bgd-generalised-price-sync-adapters/11416
 */
contract AaveV3ArbPriceFeedsUpdate_20230504_Payload is AaveV3PayloadArbitrum {
  // WSTETH / ETH / USD price adapter
  address public constant WSTETH_ADAPTER = 0x3105C276558Dd4cf7E7be71d73Be8D33bD18F211;

  function priceFeedsUpdates() public pure override returns (IEngine.PriceFeedUpdate[] memory) {
    IEngine.PriceFeedUpdate[] memory priceFeedUpdate = new IEngine.PriceFeedUpdate[](1);
    priceFeedUpdate[0] = IEngine.PriceFeedUpdate({
      asset: AaveV3ArbitrumAssets.wstETH_UNDERLYING,
      priceFeed: WSTETH_ADAPTER
    });

    return priceFeedUpdate;
  }
}
