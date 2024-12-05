#!/bin/zsh

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

set -o allexport
source "${SCRIPT_DIR}/../.env"
set +o allexport

if [ -z "$1" ]; then
	echo "Example usage:
$ ./test/universal-to-connected.sh example_message"
else
	echo "Sending message "$1" from Universal to Connected on Ethereum..."
	npx hardhat universal-withdraw-and-call \
		--contract $UNIVERSALMOD_ZETACHAIN \
		--receiver $CONNECTEDMOD_ETHEREUM \
		--zrc20 $ZRC20_ETH_ON_5 \
		--function "hello(string)" \
		--amount 0.005 \
		--network localhost \
		--call-options-is-arbitrary-call \
		--types '["string"]' $1

	echo "Sending message "$1" from Universal to Connected on BNB..."
	npx hardhat universal-withdraw-and-call \
		--contract $UNIVERSALMOD_ZETACHAIN \
		--receiver $CONNECTEDMOD_BNB \
		--zrc20 $ZRC20_BNB_ON_97 \
		--function "hello(string)" \
		--amount 0.005 \
		--network localhost \
		--call-options-is-arbitrary-call \
		--types '["string"]' $1
fi
