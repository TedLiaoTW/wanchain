#!/bin/sh

#   __        ___    _   _  ____ _           _       ____             
#   \ \      / / \  | \ | |/ ___| |__   __ _(_)_ __ |  _ \  _____   __
#    \ \ /\ / / _ \ |  \| | |   | '_ \ / _` | | '_ \| | | |/ _ \ \ / /
#     \ V  V / ___ \| |\  | |___| | | | (_| | | | | | |_| |  __/\ V / 
#      \_/\_/_/   \_\_| \_|\____|_| |_|\__,_|_|_| |_|____/ \___| \_/  
#                                                                     


echo "run geth in poa mode"
mkdir -p /wanchain/data_poa
echo "wanglu" > /tmp/passwd.txt
cp -rf /wanchain/data/keystore /wanchain/data_poa/
geth --datadir /wanchain/data_poa init ./genesis_example/genesis_poa.json
nohup geth --verbosity 4 --gasprice '200000' --datadir /wanchain/data_poa --nat none \
	--nodiscover --unlock "0x2d0e7c0813a51d3bd1d08246af2a8a7a57d8922e" --password /tmp/passwd.txt \
	--mine --minerthreads 1  --targetgaslimit 900000000  \
	--etherbase '0x2d0e7c0813a51d3bd1d08246af2a8a7a57d8922e' --networkid 718  --rpc --rpcaddr 0.0.0.0 --rpccorsdomain '*' $@  &
