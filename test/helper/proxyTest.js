const { expectEvent, shouldFail, shouldNotFail } = require('openzeppelin-test-helpers');

const KeyValueStorage = artifacts.require('KeyValueStorage');
const LogicV1 = artifacts.require('LogicV1');
const LogicV2 = artifacts.require('LogicV2');
const Proxy = artifacts.require('Proxy');
const Ownable = artifacts.require('Ownable');

const mode = process.env.MODE;

let ProxyInstance;
let StorageInstance;
let LogicV1Instance;
let LogicV2Instance;
let OwnableInstance;

contract('Proxy', async (accounts) => {
        
    before(async function () {
        StorageInstance = await KeyValueStorage.deployed();
        ProxyInstance = await Proxy.deployed();
        LogicV1Instance = await LogicV1.deployed();
        LogicV2Instance = await LogicV2.deployed();
        OwnableInstance = await Ownable.deployed();
    });

    after("write coverage/profiler output", async () => {
        if (mode === "profile") {
            await global.profilerSubprovider.writeProfilerOutputAsync();
        } else if (mode === "coverage") {
            await global.coverageSubprovider.writeCoverageAsync();
        }
    });

    it("Should set owner address correctly");

    it("Should let the owner call onlyOwner modifer");

    it("Should fail if non owner calls onlyOwner modifier");

    it("Should emit upgrade Event logs");

    it("Should set new owner Address");

    it("Should fail if the same implementation is applied");
});