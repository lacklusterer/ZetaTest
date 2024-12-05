#!/bin/zsh

GATEWAY_ETHEREUM=$(jq -r '.addresses[] | select(.type == "gatewayEVM" and .network == "ethereum") | .address' addresses.localnet.json)
GATEWAY_ZETACHAIN=$(jq -r '.addresses[] | select(.type=="gatewayZEVM" and .network=="zetachain") | .address' addresses.localnet.json)

echo "Deploying..."
npx hardhat deploy-2-env --name UniversalMod --network localhost --gateway "${GATEWAY_ZETACHAIN}"
npx hardhat deploy-2-env --name ConnectedMod --network localhost --gateway "${GATEWAY_ETHEREUM}"
