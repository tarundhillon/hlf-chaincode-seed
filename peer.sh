# in terminal 1
# Open another terminal window and set the required environment variables to override the peer configuration and start the peer node. Starting the peer with the --peer-chaincodedev=true flag puts the peer into DevMode.

export PATH=$(pwd)/fabric/build/bin:$PATH
export FABRIC_CFG_PATH=$(pwd)/fabric/sampleconfig

# we have to modify core.yaml and change the port to 10443, because 9443 is double used between the orderer and the peer (operations services)

## version with environment variables
export CORE_OPERATIONS_LISTENADDRESS=0.0.0.0:10443
export CORE_PEER_FILESYSTEMPATH=$(pwd)/data/
export FABRIC_LOGGING_SPEC=chaincode=debug 
export CORE_PEER_CHAINCODELISTENADDRESS=0.0.0.0:7052 

peer node start --peer-chaincodedev=true