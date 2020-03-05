#!/bin/bash 

#### DGLD CBT Ocean Nodes and GuardNode kinda all-in-one script ####

######## WARNING: USE AT YOUR OWN RISK - I HAVE NO IDEA WHAT I'M DOING! ########

# CryptoRaptor
# https://twitter.com/cryptopoly

# Semi-Pros
# Git clone this repo and execute this file if you're in the know. If the previous sentence is jibberish check out the easy steps :D

# Noobs
# Step 1 - Open terminal
# Step 2 - Enter 'sudo apt install curl'
# Step 3 - Enter password
# Step 4 - Press 'y'
# Step 5 - Enter 'curl -Ls https://raw.githubusercontent.com/cryptopoly/DGLD_GuardianCommandConsole/master/README.sh | bash'
# Step 6 - Restart once all installed to ensure settings are fully applied

# TERMINAL SHORTCUTS/COMMANDS:
# 'cc' shortcut to open the command console
# '00' to exit the command console
# 'dgld' and 'cbt' are shortcuts for RPC call - e.g. getblockchaininfo, getbalance
# 'nodestart' or 'nodestop' to launch/kill both nodes

######### INSTALL_SCRIPT ########

# Log stuff for troubleshooting
set -x

# Stop/kill all related processes before install
$HOME/DGLD_GuardianCommandConsole/Stop_Nodes.sh
$HOME/DGLD_GuardianCommandConsole/Stop_Nodes.dgld

# Clear previous aliases
sed -i '/ocean/d' ~/.bash_aliases
sed -i '/dgld/d' ~/.bash_aliases
sed -i '/docker/d' ~/.bash_aliases

# Remove existing $HOME/DGLD_GuardianCommandConsole folder
rm -r -f $HOME/DGLD_GuardianCommandConsole

## Save useful alias shortcuts for node functions ##
# Docker aliases
echo "alias dgld='docker exec guardnode_ocean_1 ocean-cli -rpcport=8443 -rpcuser=ocean -rpcpassword=oceanpass '" >> ~/.bash_aliases
echo "alias cbt='docker exec guardnode_ocean-cb_1 ocean-cli -rpcport=8332 -rpcuser=ocean -rpcpassword=oceanpass '" >> ~/.bash_aliases
echo "alias nodestart='docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml up -d ocean ocean-cb'" >> ~/.bash_aliases
echo "alias nodestop='docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml stop ocean ocean-cb'" >> ~/.bash_aliases
echo "alias gnstart='docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml up -d guardnode'" >> ~/.bash_aliases
echo "alias gnstop='docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml stop guardnode'" >> ~/.bash_aliases
echo "alias logs='docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml logs'" >> ~/.bash_aliases
echo "alias cc='$HOME/DGLD_GuardianCommandConsole/GuardianCommandConsole_DGLD_CBT.sh'" >> ~/.bash_aliases


# Binaries aliases
echo "alias b_dgldnodestart='$HOME/DGLD_GuardianCommandConsole/DGLD_NodeStart.dgld'" >> ~/.bash_aliases
echo "alias b_dgld='$HOME/ocean/ocean-cli -datadir=$HOME/dgld/mainnet/ocean '" >> ~/.bash_aliases
echo "alias b_dgldnodestop='$HOME/DGLD_GuardianCommandConsole/DGLD_NodeStop.dgld'" >> ~/.bash_aliases
echo "alias b_cbtnodestart='$HOME/DGLD_GuardianCommandConsole/CBT_NodeStart.dgld'" >> ~/.bash_aliases
echo "alias b_cbt='$HOME/ocean/ocean-cli -datadir=$HOME/dgld/mainnet/ocean-cb '" >> ~/.bash_aliases
echo "alias b_cbtnodestop='$HOME/DGLD_GuardianCommandConsole/CBT_NodeStop.dgld'" >> ~/.bash_aliases
echo "alias b_gnstart='$HOME/DGLD_GuardianCommandConsole/GuardNode_NodeStart.dgld'" >> ~/.bash_aliases
echo "alias b_gnstop='$HOME/DGLD_GuardianCommandConsole/GuardNode_NodeStop.dgld'" >> ~/.bash_aliases
echo "alias b_allnodestart='$HOME/DGLD_GuardianCommandConsole/Start_Nodes.dgld'" >> ~/.bash_aliases
echo "alias b_allnodestop='$HOME/DGLD_GuardianCommandConsole/Stop_Nodes.dgld'" >> ~/.bash_aliases
echo "alias b_cc='$HOME/DGLD_GuardianCommandConsole/DGLD_CBT_GuardianCommandConsole.dgld'" >> ~/.bash_aliases

# Force alias update
source ~/.bash_aliases	

## Declare environment variables ##
export dgld="docker exec guardnode_ocean_1 ocean-cli -rpcport=8443 -rpcuser=ocean -rpcpassword=oceanpass "
export cbt="docker exec guardnode_ocean-cb_1 ocean-cli -rpcport=8332 -rpcuser=ocean -rpcpassword=oceanpass "
export nodestart="docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml up -d ocean ocean-cb"
export nodestop="docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml stop ocean ocean-cb"
export gnstart="docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml up -d guardnode"
export gnstop="docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml stop guardnode"
export logs="docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml logs"
export cc="$HOME/DGLD_GuardianCommandConsole/GuardianCommandConsole_DGLD_CBT.sh"


## Declare environment variables ##
# $HOME/DGLD_GuardianCommandConsole/Variables.sh

# Install required libraries
cd $HOME
sudo apt-get update -y
git clone https://github.com/goldtokensa/config dgld
git clone https://github.com/cryptopoly/DGLD_GuardianCommandConsole
sudo apt install docker -y
sudo apt install docker-compose -y
sudo apt install jq -y
sudo apt install curl -y
sudo apt autoremove -y

# Update Docker premissions to docker without mod
sudo usermod -aG docker $USER
source ~/.bash_aliases

<<<<<<< HEAD
# Add double-click to run in terminal
gsettings set org.gnome.nautilus.preferences executable-text-activation ask

$HOME/DGLD_GuardianCommandConsole/Start_Nodes.sh

=======
# Start docker nodes in new window with sudo

# sudo gnome-terminal -- docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml up
sudo docker-compose -f $HOME/dgld/mainnet/docker/guardnode/docker-compose.yml up

# Confirm exit command
echo ""
echo ""
echo ""
echo ""
read -n 1 -s -r -p "Guardian Command Console will crash unless system is restarted - press any key to restart"
echo ""
echo ""
echo ""
echo ""

shutdown -r 0
