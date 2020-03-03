 
# set -x # debug

while true; do
	echo "Enter Blockheight for Blockhash ('00' to exit)"
	read blockheight
	if [[ -z $blockheight ]] ; then exec
	elif [[ $blockheight == "00" ]] ; then exit ; echo "Exiting DGLD Command Launcher"; echo ""; exit
	elif ! (($blockheight >= 0 && $blockheight <= $blockheight)) ; then exec
else
	$HOME/ocean/oceand -datadir=$HOME/dgld/mainnet/ocean getblockhash $blockheight
	# osascript -e 'display notification "Blockhash: '$blockhash'" with title "GoldNode"'
	echo ""
fi
done
