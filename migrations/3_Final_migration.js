const StorageLibrary = artifacts.require('StorageLibrary')
const LogicV1 = artifacts.require('LogicV1')
const LogicV2 = artifacts.require('LogicV2')

module.exports = async function(deployer, network, accounts) {
    deployer.deploy(StorageLibrary).then(function() {
      return deployer.link(StorageLibrary, LogicV2);
    }).then(function() {
      return deployer.deploy(LogicV2);
    }).then(function() {
      return deployer.deploy(LogicV1);
    });
};
