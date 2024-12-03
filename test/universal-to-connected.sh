npx hardhat universal-call \
	--contract 0x84eA74d481Ee0A5332c457a4d796187F6Ba67fEB \
	--receiver 0x9E545E3C0baAB3E08CdfD552C960A1050f373042 \
	--zrc20 0x2ca7d64A7EFE2D62A725E2B35Cf7230D6677FfEe \
	--function "hello(string)" \
	--network localhost \
	--types '["string"]' $1
