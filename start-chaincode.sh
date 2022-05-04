export CHAINCODE_ID=mycc-node:ad8182b4b2fade8a6ef451781decddc0f5ed1ed0f53d9bf4c8a023aa82cf758f
export DEVMODE_ENABLED=true

# in terminal 3
cd ./chaincode/asset-transfer
CORE_CHAINCODE_LOGLEVEL=debug CORE_PEER_TLS_ENABLED=false CORE_CHAINCODE_ID_NAME=$CHAINCODE_ID ./node_modules/.bin/fabric-chaincode-node start --peer.address 127.0.0.1:7052 --chaincode-id-name $CHAINCODE_ID

