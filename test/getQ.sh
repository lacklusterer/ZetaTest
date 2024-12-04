#!/bin/zsh

echo "Attempting function calls"

# npx hardhat call-function --network localhost
npx hardhat call-function \
	--contract 0xc351628EB244ec633d5f21fBD6621e1a683B1181 \
	--name UniversalMod \
	--network localhost &

npx hardhat call-function \
	--contract 0xFD471836031dc5108809D173A067e8486B9047A3 \
	--name ConnectedMod \
	--network localhost

wait
