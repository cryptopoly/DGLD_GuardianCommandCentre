 
# set -x # debug

# Stop node
if pgrep -x "oceand" | grep -v pgrep >&-
then
	$HOME/ocean/oceand -datadir=$HOME/dgld/mainnet/ocean stop
	sleep 1
	echo ""
	if pgrep -x "oceand" | grep -v pgrep >&-; then echo killall oceand
	sleep 2
	fi;
fi
# Start node and reindex
	$HOME/ocean/oceand -datadir=$HOME/dgld/mainnet/ocean -v --reindex=1 &
	echo "Ocean server reindexing. Please wait for node to sync"
	sleep 2
	exit
