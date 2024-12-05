#!/bin/zsh

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

set -o allexport
source "${SCRIPT_DIR}/../.env"
set +o allexport

echo "Sending message "$1" from Connected Ethereum to Universal..."
npx hardhat connected-call \
	--contract $CONNECTEDMOD_ETHEREUM \
	--receiver $UNIVERSALMOD_ZETACHAIN \
	--network localhost \
	--types '["string"]' $1

echo "Sending message "$1" from Connected BNB to Universal..."
npx hardhat connected-call \
	--contract $CONNECTEDMOD_BNB \
	--receiver $UNIVERSALMOD_ZETACHAIN \
	--network localhost \
	--types '["string"]' $1
