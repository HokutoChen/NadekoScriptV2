#tester
root=$(pwd)
echo ""

function detect_OS_ARCH_VER_BITS {
    ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
    if [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        if [ "$DISTRIB_ID" = "" ]; then
            OS=$(uname -s)
            VER=$(uname -r)
        else
            OS=$DISTRIB_ID
            VER=$DISTRIB_RELEASE
        fi
    elif [ -f /etc/debian_version ]; then
        OS=Debian  # XXX or Ubuntu??
        VER=$(cat /etc/debian_version)
        SVER=$( cat /etc/debian_version | grep -oP "[0-9]+" | head -1 )
    elif [ -f /etc/centos-release ]; then
        OS=CentOS
        VER=$( cat /etc/centos-release | grep -oP "[0-9]+" | head -1 )
    else
        OS=$(uname -s)
        VER=$(uname -r)
    fi
    case $(uname -m) in
    x86_64)
        BITS=64
        ;;
    i*86)
        BITS=32
        ;;
    armv*)
        BITS=32
        ;;
    *)
        BITS=?
        ;;
    esac
    case $(uname -m) in
    x86_64)
        ARCH=x64  # or AMD64 or Intel64 or whatever
        ;;
    i*86)
        ARCH=x86  # or IA32 or Intel32 or whatever
        ;;
    *)
        # leave ARCH as-is
        ;;
    esac
}

declare OS ARCH VER BITS

detect_OS_ARCH_VER_BITS

export OS ARCH VER BITS

if [ "$BITS" = 32 ]; then
        echo -e "Your system architecture is $ARCH which is unsupported to run Microsoft .NET Core SDK. \nYour OS: $OS \nOS Version: $VER"
        echo
        printf "\e[1;31mPlease check the NadekoBot self-hosting guide for alternatives.\e[0m\n"
        rm n-menu.sh
	      exit 1
fi        

if [ "$OS" = "Ubuntu" ]; then
    supported_ver=("14.04" "16.04" "16.10" "17.04" "18.04" "19.04" "19.10" *20.04" "20.10" "21.04")

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

if [ "$OS" = "LinuxMint" ]; then
    SVER=$( echo $VER | grep -oP "[0-9]+" | head -1 )
    supported_ver=("18" "17" "2")

    if [[ " ${supported_ver[@]} " =~ " ${SVER} " ]]; then        
        supported=1
    else
        supported=0
    fi
fi

if [ "$supported" = 0 ]; then
    echo -e "Your OS $OS $VER $ARCH looks unsupported to run Microsoft .NET Core. \nExiting..."
    printf "\e[1;31mContact Hoku on NadekoBot's support on Discord with screenshot.\e[0m\n"
    rm n-prereq.sh
    exit 1
fi

if [ "$OS" = "Linux" ]; then
    echo -e "Your OS $OS $VER $ARCH probably can run Microsoft .NET Core. \nContact NadekoBot's support on Discord with screenshot."
    rm n-prereq.sh
    exit 1
fi

echo "This installer will download all of the required packages for NadekoBot. It will use about 350MB of space. This might take awhile to download if you do not have a good internet connection.\n"
echo -e "Would you like to continue? \nYour OS: $OS \nOS Version: $VER \nArchitecture: $ARCH"

while true; do
    read -p "[y/n]: " yn
    case $yn in
        [Yy]* ) clear; echo Running NadekoBot Auto-Installer; sleep 2; break;;
        [Nn]* ) echo Quitting...; rm n-prereq.sh && exit;;
        * ) echo "Couldn't get that please type [y] for Yes or [n] for No.";;
    esac
done

echo ""



echo "This installer will download all of the required packages for NadekoBot. It will use about 350MB of space. This might take awhile to download if you do not have a good internet connection.\n"
echo -e "Your OS: $OS \nOS Version: $VER \nArchitecture: $ARCH \nWould you like to continue?"

while true; do
    read -p "[y/n]: " yn
    case $yn in
        [Yy]* ) clear; echo Running NadekoBot Auto-Installer; sleep 2; break;;
        [Nn]* ) echo Quitting...; rm n-prereq.sh && exit;;
        * ) echo "Couldn't get that please type [y] for Yes or [n] for No.";;
    esac
done

echo ""

if [ "$OS" = "Ubuntu" ]; then
     echo ""
     echo "Preparing for install..."
        
     sudo apt-get update
     sudo apt-get upgrade
        
     echo "Installing dotnet"
     echo "This installation will install the following dotnet versions"
     echo "dotnet sdk - 5.0.400"
     echo "dotnet aspnetcore runtime - 5.0.9"
     
     cd /usr/share
     sudo mkdir dotnet-arm64
     cd /usr/share/dotnet-arm64
        
     sudo wget https://download.visualstudio.microsoft.com/download/pr/4d323232-ffcc-4c09-a043-a36b554c883e/096822e81dc29383b649cd015d1ff99a/dotnet-sdk-5.0.400-linux-arm64.tar.gz
     sudo wget https://download.visualstudio.microsoft.com/download/pr/0e3da9ad-b838-419a-8ad5-caaff159083f/484d306f2778f15519201178961372bc/aspnetcore-runtime-5.0.9-linux-arm64.tar.gz
     sudo tar zxf dotnet-sdk-5.0.400-linux-arm64.tar.gz
     sudo tar zxf aspnetcore-runtime-5.0.9-linux-arm64.tar.gz
        
     export DOTNET_ROOT=/usr/share/dotnet-arm64
     export PATH=$PATH:/usr/share/dotnet-arm64
     sudo rm dotnet-sdk-5.0.400-linux-arm64.tar.gz aspnetcore-runtime-5.0.9-linux-arm64.tar.gz
     cd
     
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

        
echo
echo "NadekoBot Prerequisities Installation completed"
read -n 1 -s -p "Press any key to continue..."
sleep 2

cd 
rm $HOME/n-prerequisites.sh
exit 0
