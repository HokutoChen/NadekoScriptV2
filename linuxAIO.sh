#tester
echo ""
echo "Welcome to NadekoBot. Downloading the latest installer..."
root=$(pwd)
wget -N https://raw.githubusercontent.com/HokutoChen/NadekoScript/08bfbfaf0210eed700952c0e3e4b5b7186ca7be2/n-menu.sh

bash n-menu.sh
cd "$root"
rm "$root/n-menu.sh"
exit 0
