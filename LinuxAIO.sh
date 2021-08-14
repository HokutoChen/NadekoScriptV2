#tester
echo ""
echo "Welcome to NadekoBot. Downloading the latest installer..."
root=$(pwd)
wget -N https://raw.githubusercontent.com/HokutoChen/NadekoScript/main/nadeko_pi_master_installer.sh

bash nadeko_pi_master_installer.sh
cd "$root"
rm "$root/nadeko_pi_installer.sh"
exit 0
