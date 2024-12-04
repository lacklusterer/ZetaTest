jq '.[] | select(.type == "gateway") | select(.chain_name == "zeta_testnet") | .address' addresses.testnet.json
