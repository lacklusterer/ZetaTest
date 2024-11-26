import { HardhatRuntimeEnvironment } from "hardhat/types";

const main = async (args: any, hre: HardhatRuntimeEnvironment) => {
	const network = hre.network.name;

	const [signer] = await hre.ethers.getSigners();
	if (signer === undefined) {
		throw new Error(
			`Wallet not found. Please, run "npx hardhat account --save" or set PRIVATE_KEY env variable (for example, in a .env file)`
		);
	}

	const factory = await hre.ethers.getContractFactory(args.name);
};
