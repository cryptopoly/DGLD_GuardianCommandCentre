#!/bin/bash 
 
cd $HOME/ocean
./autogen.sh
./configure
make clean
make
make -j4
cp $HOME/ocean/src/ocean* $HOME/ocean
