#!/bin/zsh

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
echo "Script directory: $SCRIPT_DIR"

npx hardhat localnet-check

if [[ $? -eq 0 ]]; then
	continue
else
	echo "Please start localnet with command:
	$ npx hardhat localnet"
	exit
fi

zsh "${SCRIPT_DIR}/deploy.sh"
zsh "${SCRIPT_DIR}/universal-to-connected.sh message1"
zsh "${SCRIPT_DIR}/connected-to-universal.sh message2"
zsh "${SCRIPT_DIR}/getQ.sh"
