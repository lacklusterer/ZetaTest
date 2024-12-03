#!/bin/zsh

echo "Deploying modded Universal contract on Zeta (localhost)"
npx hardhat deploy-2-env --name Universal --network localhost --gateway 0x5FC8d32690cc91D4c39d9d3abcBD16989F875707

echo "Deploying modded Connected contract on connected chain (localhost)"
npx hardhat deploy-2-env --name Connected --network localhost --gateway 0x610178dA211FEF7D417bC0e6FeD39F05609AD788
