#tester
echo "Running NadekoBot"
root=$(pwd)

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi

cd "$root/nadekobot/output"
echo "Running NadekoBot. Please wait."
dotnet run NadekoBot.dll
echo "Done"

cd 
rm $HOME/n-run.sh
exit 0
