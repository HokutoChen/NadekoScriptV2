#!/bin/sh
echo ""
echo "Welcome to NadekoBot pi installer. Downloading the latest installer..."
root=$(pwd)
wget -N https://github.com/HokutoChen/NadekoScript/raw/main/n-menu.sh

bash n-menu.sh
cd 
rm $HOME/n-menu.sh
exit 0
