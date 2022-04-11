

# set the PATH environment variable to include orderer and peer binaries
export PATH=$(pwd)/fabric/build/bin:$PATH
# set the FABRIC_CFG_PATH environment variable to point to the sampleconfig folder and MSP
export FABRIC_CFG_PATH=$(pwd)/fabric/sampleconfig
# generate the genesis block for the ordering service
configtxgen -profile SampleDevModeSolo -channelID syschannel -outputBlock genesisblock -configPath $FABRIC_CFG_PATH -outputBlock $(pwd)/artifacts/genesis.block
