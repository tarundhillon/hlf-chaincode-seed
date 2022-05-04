#!/bin/bash
export PATH=$(pwd)/fabric/build/bin:$PATH
export FABRIC_CFG_PATH=$(pwd)/fabric/sampleconfig
export CHAINCODE_NAME=mycc-node
# CORE_PEER_ADDRESS=127.0.0.1:7051 peer chaincode invoke -o 127.0.0.1:7050 -C ch1 -n mycc -c '{"Args":["InitLedger"]}'  --isInit


# CORE_PEER_ADDRESS=127.0.0.1:7051 peer chaincode invoke -o 127.0.0.1:7050 -C ch1 -n $CHAINCODE_NAME -c '{"Args":["InitLedger"]}' 
opt=$1
case $opt in
        start)
                echo "Query with init..."
                CORE_PEER_ADDRESS=127.0.0.1:7051 peer chaincode invoke -o 127.0.0.1:7050 -C ch1 -n $CHAINCODE_NAME -c '{"Args":["InitLedger"]}'   --isInit
                ;;
        order)
                echo "Query with order..."
                CORE_PEER_ADDRESS=127.0.0.1:7051 peer chaincode invoke -o 127.0.0.1:7050 -C ch1 -n $CHAINCODE_NAME -c '{"Args":["InitOrderLedger"]}'
                ;;
        get-all-orders)
                echo "Query with order..."
                CORE_PEER_ADDRESS=127.0.0.1:7051 peer chaincode invoke -o 127.0.0.1:7050 -C ch1 -n $CHAINCODE_NAME -c '{"Args":["GetAllOrders"]}'
                ;;        

                
        *)
        	    echo "Default query"
                CORE_PEER_ADDRESS=127.0.0.1:7051 peer chaincode invoke -o 127.0.0.1:7050 -C ch1 -n $CHAINCODE_NAME -c '{"Args":["InitLedger"]}' 
                echo "Execution complete";;
esac