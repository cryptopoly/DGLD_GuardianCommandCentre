#!/bin/bash 
 
# set -x # debug

echo 'BlockCount:'
docker exec guardnode_ocean_1 ocean-cli -rpcport=8443 -rpcuser=ocean -rpcpassword=oceanpass getblockcount

BlockCount=$(docker exec guardnode_ocean_1 ocean-cli -rpcport=8443 -rpcuser=ocean -rpcpassword=oceanpass getblockcount)
# osascript -e 'display notification "BlockCount '$BlockCount'" with title "GoldNode"'
