#tester
echo "Welcome to Nadekobot"
echo "This is the pi installer"
root=$(pwd)
echo ""
choice=9
      echo "1. Download NadekoBot"
      echo "2. Run Nadeko (Normally)"
      echo "3. N/A"
      echo "4. Auto-Install Prerequisites (Ubuntu only)"
      echo "5. Set up credentials.json (If NadekoBot is downloaded)"
      echo "6. N/A"
      echo "7. N/A"
      echo "8. Exit"
      echo -n "Choose N/A'
while [ $choice -eq 9 ; do
read choice
if [ $choice -eq 1 ]; then
      echo ""
      echo "Downloading NadekoBot, please wait."
      wget -N https://github.com/Kwoth/NadekoBot-BashScript/raw/1.9/nadeko_installer_latest.sh && bash "$root/nadeko_installer_latest.sh"
      echo ""
      bash "$root/linuxAIO.sh"
else
            if [ $choice -eq 2 ]; then
                  echo ""
                  echo "Running Nadeko Normally, if you are running this to check Nadeko, use .die command on discord to stop Nadeko."
			            wget -N https://github.com/Kwoth/NadekoBot-BashScript/raw/1.9/nadeko_run.sh && bash "$root/nadeko_run.sh"
		            	echo ""
                  echo "Welcome back to NadekoBot."
			            sleep 2s
			            bash "$root/linuxAIO.sh"
            else
                  if [ $choice -eq 3 ]; then
                        echo ""
                        echo "Nothing to see here"
                        sleep 2s
                        bash "$root/linuxAIO.sh"
                  else
                        if [ $choice -eq 4 ]; then
                              echo ""
                              echo "Getting Auto-Installer for (Ubuntu only)"
                              wget https://github.com/HokutoChen/NadekoScript/blob/547edc55a5370fe379cea2df3b8cce8d0fb402a0/nadeko_pi_auto_installer.sh
                              
