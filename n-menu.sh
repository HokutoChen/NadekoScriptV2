#!/bin/sh
echo "Welcome to Nadekobot"
echo "This is the pi installer"
echo "This installer will only work on Ubuntu"
root=$(pwd)
echo ""
choice=9

base_url="https://github.com/HokutoChen/NadekoScript/raw/main"

script_menu="n-menu.sh"
script_prerequisites="n-prerequisites.sh"
script_install="n-install.sh"
script_run="n-run.sh"
script_arn="n-arn.sh"
script_credentials="n-credentials_setup.sh"


while [ $choice -eq 9 ]; do

      	echo "1. Install Prerequisites"
      	echo "2. Download NadekoBot"
      	echo "3. Run NadekoBot"
	echo "4. Run NadekoBot with Auto Restart"
      	echo "5. Set up credentials.json (If NadekoBot is downloaded)"
      	echo "6. Exit"
      	echo -n "Type in a number matching the option and press ENTER"
      	echo ""
      	read choice
      

	if [ $choice -eq 1 ]; then
      		echo ""
		echo "Downloading the prerequisites installer script"
		wget -N "$base_url/$script_prerequisites" && bash "$root/$script_prerequisites"
		echo ""
		choice=9
	elif [ $choice -eq 2 ]; then
                echo ""
		echo "Downloading the NadekoBot installer script"
		wget -N "$base_url/$script_install" && bash "$root/$script_install"
		echo ""
		sleep 2s
		choice=9
	elif [ $choice -eq 3 ]; then
                echo ""
		echo "Downloading the NadekoBot run script"
		wget -N "$base_url/$script_run" && bash "$root/$script_run"
		echo ""
		sleep 2s
		bash "$root/linuxAIO.sh"
	elif [ $choice -eq 4 ]; then
              	echo ""
		echo "Downloading the NadekoBot run and auto restart script"
		wget -N "$base_url/$script_arn" && bash "$root/$script_arn"
		echo ""
		sleep 2s
		bash "$root/linuxAIO.sh"
	elif [ $choice -eq 5 ]; then
		echo ""
		echo "Downloading Credentials setup script"
		wget -N "$base_url/$script_credentials" && bash "$root/$script_credentials"
		echo ""
		sleep 2s
		bash "$root/linuxAIO.sh"
	else
		echo "Invalid choice"
		echo ""
		choice=9
	fi
done

cd "$root"
rm "$root/n-menu.sh"
exit 0
