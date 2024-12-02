import { task, types } from "hardhat/config";
import type { HardhatRuntimeEnvironment } from "hardhat/types";

const main = async (args: any, hre: HardhatRuntimeEnvironment) => {
	const { ethers } = hre;
	const [signer] = await ethers.getSigners();

	const factory = await hre.ethers.getContractFactory(args.name);
	const contract = factory.attach(args.contract).connect(signer);

	if (!contract) {
		throw new Error(`Contract at address ${args.contract} could not be found.`);
	}

	try {
		const tx = await contract.getReceivedQueue();
		console.log(tx);
	} catch (error) {
		console.error("Error calling function:", error);
		throw new Error(`${error.message}`);
	}
};

task("call-function", "Call function in contract", main)
	.addParam(
		"contract",
		"The address of the deployed contract",
		"0xc351628EB244ec633d5f21fBD6621e1a683B1181"
	)
	.addParam("name", "The name of the contract", "UniversalMod");
