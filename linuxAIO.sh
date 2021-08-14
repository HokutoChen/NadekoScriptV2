#tester
echo ""
echo "Welcome to NadekoBot. Downloading the latest installer..."
root=$(pwd)
wget -N https://raw.githubusercontent.com/HokutoChen/NadekoScript/main/n-menu.sh

bash nadeko_pi_master_installer.sh
cd "$root"
rm "$root/n-menu.sh"
exit 0
