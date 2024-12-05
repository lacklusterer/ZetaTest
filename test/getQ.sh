#!/bin/zsh

set -o allexport
source "${SCRIPT_DIR}/../.env"
set +o allexport

echo "Getting received queues..."

( 
	UNIVERSAL_QUEUE=$(
		npx hardhat call-function \
			--contract $UNIVERSALMOD_ZETACHAIN \
			--name UniversalMod \
			--network localhost
	)
	echo "Universal Received Queue: ${UNIVERSAL_QUEUE}"
) &

( 
	ETHEREUM_QUEUE=$(
		npx hardhat call-function \
			--contract $CONNECTEDMOD_ETHEREUM \
			--name ConnectedMod \
			--network localhost
	) 
	echo "Ethereum Received Queue: ${ETHEREUM_QUEUE}"
) &

( 
	BNB_QUEUE=$(
		npx hardhat call-function \
			--contract $CONNECTEDMOD_BNB \
			--name ConnectedMod \
			--network localhost
	)
echo "BNB Received Queue: ${BNB_QUEUE}"
) &

wait
