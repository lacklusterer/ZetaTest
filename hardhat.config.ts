import "./tasks/deploy";
import "./tasks/universalCall";
import "./tasks/connectedCall";
import "./tasks/connectedDeposit";
import "./tasks/connectedDepositAndCall";
import "./tasks/universalWithdraw";
import "./tasks/universalWithdrawAndCall";
import "./tasks/deployAndWriteToEnv";
import "./tasks/arbitraryCall";
import "@zetachain/localnet/tasks";
import "@nomicfoundation/hardhat-toolbox";
import "@zetachain/toolkit/tasks";

import { getHardhatConfigNetworks } from "@zetachain/networks";
import { HardhatUserConfig } from "hardhat/config";

const config: HardhatUserConfig = {
	networks: {
		...getHardhatConfigNetworks(),
	},
	solidity: "0.8.26",
};

export default config;
