// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {FilAddresses} from "@zondax/filecoin-solidity/contracts/v0.8/utils/FilAddresses.sol";
import {CommonTypes} from "@zondax/filecoin-solidity/contracts/v0.8/types/CommonTypes.sol";
import {MarketAPI} from "@zondax/filecoin-solidity/contracts/v0.8/MarketAPI.sol";
import {MarketTypes} from "@zondax/filecoin-solidity/contracts/v0.8/types/MarketTypes.sol";
import {PowerAPI} from "@zondax/filecoin-solidity/contracts/v0.8/PowerAPI.sol";
import {PowerTypes} from "@zondax/filecoin-solidity/contracts/v0.8/types/PowerTypes.sol";
import {DataCapAPI} from "@zondax/filecoin-solidity/contracts/v0.8/DataCapAPI.sol";

contract Check {
    event Client(uint64 indexed client);

    function getFilAddress(address ethAddress) public pure returns (CommonTypes.FilAddress memory) {
        return FilAddresses.fromBytes(FilAddresses.fromEthAddress(ethAddress).data);
    }

    function getEthAddress(
        CommonTypes.FilAddress calldata filAddress
    ) public pure returns (address) {
        return FilAddresses.toEthAddress(filAddress);
    }

    // create different functions for all of the follwing functions

    function getDealActivation(
        uint64 dealId
    ) public view returns (MarketTypes.GetDealActivationReturn memory) {
        return MarketAPI.getDealActivation(dealId);
    }

    function checkAllFunctions(
        uint64 dealId
    )
        public
        view
        returns (
            MarketTypes.GetDealActivationReturn memory,
            MarketTypes.GetDealDataCommitmentReturn memory,
            uint64,
            uint64,
            CommonTypes.BigInt memory
        )
    {
        return (
            MarketAPI.getDealActivation(dealId),
            MarketAPI.getDealDataCommitment(dealId),
            MarketAPI.getDealClient(dealId),
            MarketAPI.getDealProvider(dealId),
            MarketAPI.getDealClientCollateral(dealId)
        );
    }

    function checkAllFunction(
        uint64 dealId
    )
        public
        view
        returns (MarketTypes.GetDealActivationReturn memory)
    // CommonTypes.BigInt memory // CommonTypes.DealLabel memory,
    // MarketTypes.GetDealTermReturn memory,
    // CommonTypes.BigInt memory,
    // bool
    {
        return (
            MarketAPI.getDealActivation(dealId)
            // MarketAPI.getDealProviderCollateral(dealId)
            // MarketAPI.getDealLabel(dealId),
            // MarketAPI.getDealTerm(dealId),
            // MarketAPI.getDealTotalPrice(dealId),
            // MarketAPI.getDealVerified(dealId)
        );
    }

    function checkAllFunctions2()
        public
        view
        returns (
            uint64,
            int64,
            CommonTypes.BigInt memory,
            string memory,
            string memory,
            CommonTypes.BigInt memory
        )
    {
        return (
            PowerAPI.minerCount(),
            PowerAPI.minerConsensusCount(),
            PowerAPI.networkRawPower(),
            DataCapAPI.name(),
            DataCapAPI.symbol(),
            DataCapAPI.totalSupply()
        );
    }

    function balanceOf(address account) public view returns (CommonTypes.BigInt memory) {
        return DataCapAPI.balance(getFilAddress(account));
    }
}
