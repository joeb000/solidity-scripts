#!/bin/bash

#############################################################################################
## NOTE: You'll have to edit the "from" value to an unlocked account on your node and the  ##
## "to" should point at the contract address...if you didnt modify the contract            ##
## the data field should still work fine as is                                             ##
##                                                                                         ##
## be sure to chmod 755 this script before attempting to run                               ##
## Example usage:                                                                          ##
##                 ./gunShell.sh shot                                                      ##
#############################################################################################

echo $1
if [ $1 == "shot" ]; then
  echo "GUN SHOT"
  curl -X POST --data '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from": "0x63c8a5a6212aecec701c93688be130bced7f3c08","to": "0xdebc49b9174e620d88601d0a044881adb2edea3e",  "gas": "0x7a120", "data":"0xcea73ef0000000000000000000000000f7caaeb6aa9a57774d41c765631c84c28b7aa588000000000000000000000000000000000000000000000000000000000240991300000000000000000000000000000000000000000000000000000000074b8419"}],"id":8}' http://localhost:8545
elif [ $1 == "drawn" ]; then
  #statements
  echo "GUN DRAWN"
  curl -X POST --data '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from": "0x63c8a5a6212aecec701c93688be130bced7f3c08","to": "0xdebc49b9174e620d88601d0a044881adb2edea3e",  "gas": "0x7a120", "data":"0x964be65c000000000000000000000000f7caaeb6aa9a57774d41c765631c84c28b7aa588000000000000000000000000000000000000000000000000000000000240991300000000000000000000000000000000000000000000000000000000074b8419"}],"id":8}' http://localhost:8545

elif [ $1 == "holster" ]; then
  #statements
  echo "GUN HOLSTERED"
  curl -X POST --data '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from": "0x63c8a5a6212aecec701c93688be130bced7f3c08","to": "0xdebc49b9174e620d88601d0a044881adb2edea3e",  "gas": "0x7a120", "data":"0xc13b061b"}],"id":8}' http://localhost:8545

fi
