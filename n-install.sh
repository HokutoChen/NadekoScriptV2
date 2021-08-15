#!/bin/sh
root=$(pwd)
echo ""
echo "NadekoBot Installer started."

if hash git 1>/dev/null 2>&1
then
    echo ""
    echo "Git Installed."
else
    echo ""    
    echo "Git is not installed. Please install Git."
    exit 1
fi

if hash dotnet 1>/dev/null 2>&1
then
    echo ""
    echo "Dotnet installed."
else
    echo ""
    echo "Dotnet is not installed. Please install dotnet."
    exit 1
fi

echo ""
echo "Downloading NadekoBot, please wait..."
# todo data handling
git clone https://gitlab.com/kwoth/nadekobot -b v3 --depth 1
cd nadekobot
echo ""
echo "NadekoBot downloaded."

ehco ""
echo "Building NadekoBot"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
dotnet build src/NadekoBot/NadekoBot.csproj -c Release -o output/
echo ""
echo "Building done."

cd 
rm $HOME/n-install.sh
exit 0
