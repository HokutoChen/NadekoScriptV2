#tester
echo "Running NadekoBot"
echo ""
echo "NadekoBot 1.9+"
echo "Mirai was here."
root=$(pwd)
youtube-dl -U
root=$(pwd)

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi

cd $HOME/NadekoBot
dotnet restore
dotnet build -c Release
cd "$root/NadekoBot/src/NadekoBot"
echo "Running NadekoBot. Please wait."
dotnet run -c Release
echo "Done"

cd 
rm $HOME/n-run.sh
exit 0
