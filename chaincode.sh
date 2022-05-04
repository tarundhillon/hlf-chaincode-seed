export PATH=$(pwd)/fabric/build/bin:$PATH
export FABRIC_CFG_PATH=$(pwd)/fabric/sampleconfig

export SEQ=1
export CHAINCODE_NAME=mycc-node
export CHAIONCODE_VERSION=1.0
export CHAINCODE_SERVER_ADDRESS=127.0.0.1:7051
export CHAINCODE_ID=mycc-node:ad8182b4b2fade8a6ef451781decddc0f5ed1ed0f53d9bf4c8a023aa82cf758f

export DEVMODE_ENABLED=true

# in terminal 3
# cd ./chaincode/asset-transfer
# CORE_CHAINCODE_LOGLEVEL=debug CORE_PEER_TLS_ENABLED=false CORE_CHAINCODE_ID_NAME=$CHAINCODE_ID ./node_modules/.bin/fabric-chaincode-node start --peer.address 127.0.0.1:7052 --chaincode-id-name $CHAINCODE_ID


opt=$1
case $opt in
        install)
                echo "Chaincode - pack, install and query ... "
                peer lifecycle chaincode package $CHAINCODE_NAME.$CHAIONCODE_VERSION.tar.gz --path ./chaincode/asset-transfer --lang node --label $CHAINCODE_NAME
                peer lifecycle chaincode install $CHAINCODE_NAME.$CHAIONCODE_VERSION.tar.gz --peerAddresses $CHAINCODE_SERVER_ADDRESS
                peer lifecycle chaincode queryinstalled --peerAddresses $CHAINCODE_SERVER_ADDRESS
                ;;
        approve)
                echo "Approve chaincode "
                peer lifecycle chaincode approveformyorg  -o 127.0.0.1:7050 --channelID ch1 --name $CHAINCODE_NAME --version 1.0 --sequence $SEQ --init-required --signature-policy "OR ('SampleOrg.member')" --package-id $CHAINCODE_ID
                peer lifecycle chaincode checkcommitreadiness -o 127.0.0.1:7050 --channelID ch1 --name $CHAINCODE_NAME --version 1.0 --sequence $SEQ --init-required --signature-policy "OR ('SampleOrg.member')" 
                peer lifecycle chaincode commit -o 127.0.0.1:7050 --channelID ch1 --name $CHAINCODE_NAME --version 1.0 --sequence $SEQ --init-required --signature-policy "OR ('SampleOrg.member')" --peerAddresses 127.0.0.1:7051
                ;;
        build)
                echo "Build ..."
                cd ./chaincode/asset-transfer
                npm run build
                echo "Build complete."
                ;;
        start)
                echo "Build and start ..."
                cd ./chaincode/asset-transfer
                npm run build
                CORE_CHAINCODE_LOGLEVEL=debug CORE_PEER_TLS_ENABLED=false CORE_CHAINCODE_ID_NAME=$CHAINCODE_ID ./node_modules/.bin/fabric-chaincode-node start --peer.address 127.0.0.1:7052 --chaincode-id-name $CHAINCODE_ID
                # CORE_CHAINCODE_LOGLEVEL=debug CORE_PEER_TLS_ENABLED=false CORE_CHAINCODE_ID_NAME=$CHAINCODE_ID npm run start:server-debug
                ;;
        *)
        	    echo "Invalid option"

esac


