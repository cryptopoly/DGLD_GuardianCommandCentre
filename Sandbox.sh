#!/bin/bash 
# jq '.assets,.ref' $HOME/j.json


# jq '.n,.m,.height' $HOME/j.json


# cat $HOME/j.json | grep ref

# jq '.blockNumber' $HOME/peg.json

# cat $HOME/j.json| jq '.assets.headers | [.sender, .to, .subject, ."x-received-time", .received, .from, .date, .id, .to, .subject, .fromfull] + [(.time | tostring)] | join(", ")'


#!/bin/bash

jq | $HOME/ocean/ocean-cli -datadir=$HOME/dgld/mainnet/ocean-cb help | awk '{ print ++lvalue, $0 }'

