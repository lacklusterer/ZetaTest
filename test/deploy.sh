#!/bin/zsh

GATEWAY_ETHEREUM=$(jq -r '.addresses[] | select(.type == "gatewayEVM" and .network == "ethereum") | .address' addresses.localnet.json)
GATEWAY_ZETACHAIN=$(jq -r '.addresses[] | select(.type=="gatewayZEVM" and .network=="zetachain") | .address' addresses.localnet.json)

echo "Deploying modded Universal contract on Zeta (localhost)"
npx hardhat deploy-2-env --name UniversalMod --network localhost --gateway ${GATEWAY_ZETACHAIN}

echo "Deploying modded Connected contract on connected chain (localhost)"
npx hardhat deploy-2-env --name ConnectedMod --network localhost --gateway ${GATEWAY_ETHEREUM}
