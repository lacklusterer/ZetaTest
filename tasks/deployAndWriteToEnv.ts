import { task, types } from "hardhat/config";
import { HardhatRuntimeEnvironment } from "hardhat/types";
import fs from "fs";
import path from "path";

const updateEnvFile = (key: string, value: string) => {
	const envFilePath = path.resolve(process.cwd(), ".env");
	const envFileExists = fs.existsSync(envFilePath);
	let envContent = envFileExists ? fs.readFileSync(envFilePath, "utf8") : "";

	// regex to find the key in the .env file
	const keyRegex = new RegExp(`^${key}=.*`, "m");

	if (keyRegex.test(envContent)) {
		// replace the existing value
		envContent = envContent.replace(keyRegex, `${key}=${value}`);
	} else {
		// append the new key-value pair
		envContent += `\n${key}=${value}`;
	}

	// write updated content back to the .env file
	fs.writeFileSync(envFilePath, envContent, { encoding: "utf8" });
};

const main = async (args: any, hre: HardhatRuntimeEnvironment) => {
	const network = hre.network.name;

	const [signer] = await hre.ethers.getSigners();
	if (signer === undefined) {
		throw new Error(
			`Wallet not found. Please, run "npx hardhat account --save" or set PRIVATE_KEY env variable (for example, in a .env file)`
		);
	}

	const factory = await hre.ethers.getContractFactory(args.name);
	const contract = await (factory as any).deploy(args.gateway);
	await contract.deployed();

	const contractInfo = {
		contractAddress: contract.address,
		deployer: signer.address,
		network: network,
		transactionHash: contract.deployTransaction.hash,
	};

	// environment variable key
	const envKey = `${args.name.toUpperCase()}_${network.toUpperCase()}`;
	updateEnvFile(envKey, contract.address);

	if (args.json) {
		console.log(JSON.stringify(contractInfo));
	} else {
		console.log(`🔑 Using account: ${signer.address}
🚀 Successfully deployed "${args.name}" contract on ${network}.
📜 Contract address: ${contract.address}
🖊️ Updated entry in .env: ${envKey}=${contract.address}
`);
	}
};

task("deploy-2-env", "Deploy the contract and write to .env", main)
	.addFlag("json", "Output in JSON")
	.addOptionalParam("name", "Contract to deploy", "Universal")
	.addOptionalParam(
		"gateway",
		"Gateway address (default: ZetaChain Gateway on testnet)",
		"0x6c533f7fe93fae114d0954697069df33c9b74fd7"
	);
