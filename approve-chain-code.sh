# in terminal 4

export PATH=$(pwd)/fabric/build/bin:$PATH
export FABRIC_CFG_PATH=$(pwd)/fabric/sampleconfig
export SEQ=1
export CHAINCODE_NAME=mycc-node
export CHAINCODE_ID=mycc-node:ad8182b4b2fade8a6ef451781decddc0f5ed1ed0f53d9bf4c8a023aa82cf758f

peer lifecycle chaincode approveformyorg  -o 127.0.0.1:7050 --channelID ch1 --name $CHAINCODE_NAME --version 1.0 --sequence $SEQ --init-required --signature-policy "OR ('SampleOrg.member')" --package-id $CHAINCODE_ID
peer lifecycle chaincode checkcommitreadiness -o 127.0.0.1:7050 --channelID ch1 --name $CHAINCODE_NAME --version 1.0 --sequence $SEQ --init-required --signature-policy "OR ('SampleOrg.member')" 
peer lifecycle chaincode commit -o 127.0.0.1:7050 --channelID ch1 --name $CHAINCODE_NAME --version 1.0 --sequence $SEQ --init-required --signature-policy "OR ('SampleOrg.member')" --peerAddresses 127.0.0.1:7051