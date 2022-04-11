# in terminal 4

export PATH=$(pwd)/fabric/build/bin:$PATH
export FABRIC_CFG_PATH=$(pwd)/fabric/sampleconfig
export SEQ=1
export CHAINCODE_NAME=mycc-node

peer lifecycle chaincode approveformyorg  -o 127.0.0.1:7050 --channelID ch1 --name $CHAINCODE_NAME --version 1.0 --sequence $SEQ --init-required --signature-policy "OR ('SampleOrg.member')" --package-id mycc:1.0

peer lifecycle chaincode checkcommitreadiness -o 127.0.0.1:7050 --channelID ch1 --name $CHAINCODE_NAME --version 1.0 --sequence $SEQ --init-required --signature-policy "OR ('SampleOrg.member')"

peer lifecycle chaincode commit -o 127.0.0.1:7050 --channelID ch1 --name $CHAINCODE_NAME --version 1.0 --sequence $SEQ --init-required --signature-policy "OR ('SampleOrg.member')" --peerAddresses 127.0.0.1:7051