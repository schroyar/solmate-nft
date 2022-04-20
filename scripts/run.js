
const main = async() => {
    const [deployer] = await hre.ethers.getSigners();
    const accountBalance = await deployer.getBalance();

    console.log("Deploying contract with account: ", deployer.address);
    console.log("Deployer account balance: ", hre.ethers.utils.formatEther(accountBalance));

    const Token = await hre.ethers.getContractFactory('Contract');
    const portal = await Token.deploy(
        "TSTSTS",
        "TS",
        "basebase"
    );
    await portal.deployed();

    console.log('NFT Mint address: ', portal.address);

};

const runMain = async () => {
    try {
        await main();
    } catch(error) {
        console.error(error);
        process.exit(1);
    }
};

runMain();