# npx hardhat universal-call \
# 	--contract 0xc351628EB244ec633d5f21fBD6621e1a683B1181 \
# 	--receiver 0xFD471836031dc5108809D173A067e8486B9047A3 \
# 	--zrc20 0x2ca7d64A7EFE2D62A725E2B35Cf7230D6677FfEe \
# 	--function "hello(string)" \
# 	--network localhost \
# 	--types '["string"]' $1

npx hardhat universal-withdraw-and-call \
	--contract 0xc351628EB244ec633d5f21fBD6621e1a683B1181 \
	--receiver 0xFD471836031dc5108809D173A067e8486B9047A3 \
	--zrc20 0x2ca7d64A7EFE2D62A725E2B35Cf7230D6677FfEe \
	--function "hello(string)" \
	--amount 0.005 \
	--network localhost \
	--call-options-is-arbitrary-call \
	--types '["string"]' $1
