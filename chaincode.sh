# #go mod init chaincode
# cd chaincode/sacc
# G111MODULE=on go mod vendor 
# go build -o simpleChaincode 


# export DEVMODE_ENABLED=true
# # in terminal 3
# CORE_CHAINCODE_LOGLEVEL=debug CORE_PEER_TLS_ENABLED=false CORE_CHAINCODE_ID_NAME=mycc:1.0 ./simpleChaincode -peer.address 127.0.0.1:7052


# cd chaincode/asset-transfer
# # npm install
# # npm run build

export PATH=$(pwd)/fabric/build/bin:$PATH
export FABRIC_CFG_PATH=$(pwd)/fabric/sampleconfig

export CHAINCODE_NAME=mycc-node
export CHAIONCODE_VERSION=1.0
export CHAINCODE_SERVER_ADDRESS=127.0.0.1:7051
export CHAINCODE_ID=$CHAINCODE_NAME:$CHAINCODE_ID
# npm run start:server-nontls

peer lifecycle chaincode package $CHAINCODE_NAME.$CHAIONCODE_VERSION.tar.gz --path ./chaincode/asset-transfer --lang node --label $CHAINCODE_NAME
peer lifecycle chaincode install $CHAINCODE_NAME.$CHAIONCODE_VERSION.tar.gz --peerAddresses $CHAINCODE_SERVER_ADDRESS