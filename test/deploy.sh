#!/bin/zsh

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
LOCALNET_ADDRESSES="${SCRIPT_DIR}/../addresses.localnet.json"

GATEWAY_ZETACHAIN=$(jq -r '.addresses[] | select(.type=="gatewayZEVM" and .network=="zetachain") | .address' "$LOCALNET_ADDRESSES")
GATEWAY_ETHEREUM=$(jq -r '.addresses[] | select(.type == "gatewayEVM" and .network == "ethereum") | .address' "$LOCALNET_ADDRESSES")
GATEWAY_BNB=$(jq -r '.addresses[] | select(.type == "gatewayEVM" and .network == "bnb") | .address' "$LOCALNET_ADDRESSES")


echo "Deploying..."
npx hardhat deploy-2-env --name UniversalMod --network localhost --gateway "${GATEWAY_ZETACHAIN}" --chain zetachain
npx hardhat deploy-2-env --name ConnectedMod --network localhost --gateway "${GATEWAY_ETHEREUM}" --chain ethereum
npx hardhat deploy-2-env --name ConnectedMod --network localhost --gateway "${GATEWAY_BNB}" --chain bnb

