#!/bin/bash 
 
# set -x # debug

echo "DGLD Node Status (docker):"
dgld_main_status=$(ps -ef | grep -w chain=gold_main | grep -v grep | awk '{ print "Online" }')
echo $dgld_main_status

echo "CBT Node Status (docker):"
cbt_main_status=$(ps -ef | grep -w chain=ocean_main | grep -v grep | awk '{ print "Online" }')
echo $cbt_main_status

echo "GuardNode Status (docker):"
pgrep guardnode | awk '{ print "Online" }'s
echo $guardnode_status


# MacOS Only
# open /Applications/Docker.app &

if [[ $dgld_main_status = "Online" ]] && [[ $cbt_main_status = "Online" ]]
then
	# echo "DGLD and CBT Ocean nodes online (docker)"
	sleep 0
else
	echo "DGLD, CBT and GuardNode Ocean docker services starting..."
	# gnome-terminal -- docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml up
	# nohup docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml up &
	docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml up -d ocean &
	docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml up -d ocean-cb &
	docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml up -d guardnode &
	# nohup docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml up $HOME/DGLD_GuardianCommandConsole/GuardNodeLogs.txt &
	sleep 4
fi

