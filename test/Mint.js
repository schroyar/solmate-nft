const { expect } = require("chai");
const { equal } = require("minimalistic-assert");

describe("NFT Mint contract", function () {
  it("Should Mint a NFT", async function () {
    const [owner] = await ethers.getSigners();
    const contractFactory = await ethers.getContractFactory('Contract');
    const contractDeployed = await contractFactory.deploy(
      "TSTSTS",
      "TS",
      "basebase"
    );
    
    const mintPrice = await contractDeployed.MINT_PRICE() / 1000000000000000000;
    /*
    let nftId = await contractDeployed.mintTo(owner.address, {
      value: mintPrice
    })
    */
    let nftMAX = await contractDeployed.MAX_SUPPLY();
    //console.log(nftId);
    console.log(nftMAX);
    expect(nftMAX == 100);
  });
});