#!/bin/bash 

# set -x # debug

while true; do
	echo "Enter CBT ocean-cli RPC command e.g. getblockchaininfo, ('00' to exit)"
	read freestyle
	if [[ -z $freestyle ]] ; then exec
	elif [[ $freestyle == "00" ]] ; then exit ;
else
	docker exec guardnode_ocean-cb_1 ocean-cli -rpcport=8332 -rpcuser=ocean -rpcpassword=oceanpass $freestyle
	echo ""
fi
done
