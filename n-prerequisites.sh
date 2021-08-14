#tester
root=$(pwd)
echo ""
if [ "$BITS" = 32 ]; then
        echo -e "Your system architecture is $ARCH which is unsupported to run Microsoft .NET Core SDK. \nYour OS: $OS \nOS Version: $VER"
        echo
        printf "\e[1;31mPlease check the NadekoBot self-hosting guide for alternatives.\e[0m\n"
        rm n-menu.sh
	      exit 1
fi        

if [ "$OS" = "Ubuntu" ]; then
    supported_ver=("14.04" "16.04" "16.10" "17.04" "18.04" "19.04" "19.10" "20.10" "21.04")

    if [[ " ${supported_ver[@]} " =~ " ${VER} " ]]; then        
        supported=1
    elif [ "$VER" = "18.10" ]; then
        supported=1
        VER=18.04
        echo -e "Using Ubuntu 18.04 Installation scripts.\nIf the installation fails contact NadekoBot support."
        sleep 5
    else
        supported=0
    fi
fi


echo "Your OS: $OS \nOS Version: $VER"        
echo "If you are running ubuntu, enter 1 to continue"
echo "If you are not running ubuntu, enter 0 to exit"
if [ $choice -eq 1 ]; then
     echo ""
     echo "This installer will download all of the required packages for NadekoBot. It will use about N/A MB of space. This might take awhile to download if you do not have a good internet connection."
     echo ""
     read -n 1 --s -p "Press any key to continue..."
     echo ""
     echo "Preparing for install..."
        
     sudo apt-get update
     sudo apt-get upgrade
        
     echo "Installing dotnet"
     cd /usr/share
     kdir dotnet-arm64
     cd /usr/share/dotnet-arm64
        
     wget https://download.visualstudio.microsoft.com/download/pr/4d323232-ffcc-4c09-a043-a36b554c883e/096822e81dc29383b649cd015d1ff99a/dotnet-sdk-5.0.400-linux-arm64.tar.gz
     wget https://download.visualstudio.microsoft.com/download/pr/0e3da9ad-b838-419a-8ad5-caaff159083f/484d306f2778f15519201178961372bc/aspnetcore-runtime-5.0.9-linux-arm64.tar.gz
     tar zxf dotnet-sdk-5.0.400-linux-arm64.tar.gz
     tar zxf aspnetcore-runtime-5.0.9-linux-arm64.tar.gz
        
     export DOTNET_ROOT=/usr/share/dotnet-arm64
     export PATH=$PATH:/usr/share/dotnet-arm64
        
     echo "Installing Git and Redis"
     sudo apt-get install git redis-server -y
        
     echo "Installing music Prerequisites..."
     sudo add-apt-repository ppa:chris-lea/libsodium -y
     sudo apt-get install libopus0 opus-tools libopus-dev libsodium-dev -y
     echo ""
     sudo apt-get install ffmpeg
     sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
     sudo chmod a+rx /usr/local/bin/youtube-dl
fi

        
        
else
    if [ $choice -eq 0 ]; then
    exit 0
fi

echo
echo "NadekoBot Prerequisities Instllation
read -n 1 -s -p "Press any key to continue..."
sleep 2

cd "$root"
rm "$root/n-menu.sh"

exit 0
