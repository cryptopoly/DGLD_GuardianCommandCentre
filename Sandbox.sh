#!/bin/bash 



# echo "DGLD Node Status (binaries):"
# dgld_main_status=$(ps -ef | grep -w ocean | grep -v ocean-cb | grep -v guardnode | grep -v chain=gold_main | grep -v grep | awk '{ print "Online" }')
# echo $dgld_main_status

# echo "CBT Node Status (binaries):"
# cbt_main_status=$(ps -ef | grep -w ocean-cb | grep -v grep | awk '{ print "Online" }')
# echo $cbt_main_status

# echo "GuardNode Status (python):"
# guardnode_status=$(ps -ef | grep -w run_guardnode | grep -v grep | awk '{ print "Online" }')
# echo $guardnode_status

# echo "DGLD Node Status (docker):"
# docker_dgld_main_status=$(ps -ef | grep -w chain=gold_main | grep -v grep | awk '{ print "Online" }')
# echo $dgld_main_status

# echo "CBT Node Status (docker):"
# docker_cbt_main_status=$(ps -ef | grep -w chain=ocean_main | grep -v grep | awk '{ print "Online" }')
# echo $cbt_main_status

# echo "GuardNode Status (docker):"
# docker_guardnode_status=$(pgrep guardnode | awk '{ print "Online" }')
# echo $guardnode_status

# # if [ $cbt_main_status = "Online" ] ; then echo "poo" ; fi

# if [ $cbt_main_status = "Online" ] ; then ocean_client=$($HOME/ocean/ocean-cli -datadir=$HOME/dgld/mainnet/ocean-cb getbalance);
# elif [ $docker_cbt_main_status = "Online" ] ; then ocean_client=$(docker exec guardnode_ocean-cb_1 ocean-cli -rpcport=8332 -rpcuser=ocean -rpcpassword=oceanpass getbalance);
# else printf "${RED}Offline${NC}";
# fi

# echo $ocean_client


# WORKING NO API KEY REQUIRED
gold_bid=$(curl -X GET https://forex-data-feed.swissquote.com/public-quotes/bboquotes/instrument/XAU/USD | jq -c '.[].spreadProfilePrices[].bid')
# echo $gold_bid

echo $gold_bid | jq min('.')


# jq -c '.[].spreadProfilePrices[] | group_by(.score)'




