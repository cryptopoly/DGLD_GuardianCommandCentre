 
# set -x # debug

echo "Enter RPC command e.g. getblockchaininfo, ('00' to exit)"
read freestyle
$HOME/ocean/ocean-cli -datadir=$HOME/dgld/mainnet/ocean-cb $freestyle
echo ""

