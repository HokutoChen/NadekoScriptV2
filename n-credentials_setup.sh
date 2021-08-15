#tester
root=$(pwd)

echo ""
echo
echo -e "Let's begin creating a new credentials.json file if you are about to run the NadekoBot for the first time. \n \nPlease read JSON Explanations in the guide... \n \nPress [Y] when you are ready to continue or [N] to exit."

while true; do
  read -p "[y/n]: " yn
  case $yn in
    [Yy]* ) clear; break;;
    [Nn]* ) echo Exiting...; exit;;
    * ) echo "Couldn't get that please type [y] for Yes or [n] for No.";;
  esac
done
clear
cd $HOME/nadekobot/src/NadekoBot
mv credentials.json credentials.json.old

echo "Please enter your bot token \(It is not bot secret, it should be ~59 characters long.\):"
echo ""
read token
echo ""
echo "Alright saved \'$token\' as your bot\'s token."
echo ""
echo "----------"
echo ""

echo "Please enter your own ID \(Refer to the guide, it will be bot\'s owner ID.\):"
echo ""
read ownerid
echo ""
echo "Alright saved \'$ownerid\' as owner\'s ID."
echo ""
echo "----------"
echo ""

echo "Please enter Google API key \(Refer to the guide.\):"
echo ""
read googleapi
echo ""
echo "Alright saved \'$googleapi\' as your bot\'s Google API Key."
echo ""
echo "----------"
echo ""

echo -e "Please enter Mashape Key or Just Press [Enter Key] to skip. (optional) \nRefer to the JSON Explanations guide:"
echo ""
read mashapekey
echo ""
echo Alright saved \'$mashapekey\' as your bot\'s Mashape Key.
echo ""
echo "----------"
echo ""

echo -e "Please enter OSU API Key or Just Press [Enter Key] to skip. (optional) \nRefer to the JSON Explanations guide:"
echo ""
read osu
echo ""
echo Alright saved \'$osu\' as your bot\'s OSU API Key.
echo ""
echo "----------"
echo ""

echo -e "Please enter Cleverbot API Key or Just Press [Enter Key] to skip. (optional) \nRefer to the JSON Explanations guide:"
echo ""
read cleverbot
echo ""
echo Alright saved \'$cleverbot\' as your bot\'s Cleverbot API Key.
echo ""
echo "----------"
echo ""

echo -e "Please enter Twitch Client ID or Just Press [Enter Key] to skip. (optional) \nRefer to the JSON Explanations guide:"
echo ""
read twitchcid
echo ""
echo Alright saved \'$twitchcid\' as your bot\'s Twitch Client ID.
echo ""
echo "----------"
echo ""

echo -e "Please enter Location IQ Api Key or Just Press [Enter Key] to skip. (optional) \nRefer to the JSON Explanations guide:"
echo ""
read locationiqapi
echo ""
echo Alright saved \'$locationiqapi\' as your bot\'s Location IQ API Key.
echo ""
echo "----------"
echo ""

echo -e "Please enter Timezone DB Api Key or Just Press [Enter Key] to skip. (optional) \nRefer to the JSON Explanations guide:"
echo ""
read timedbapi
echo ""
echo Alright saved \'$timedbapi\' as your bot\'s Timezone DB API Key.
echo ""
echo "----------"
echo ""

echo "{
  \"ClientId\": $clientid,
  \"Token\": \"$token\",
  \"OwnerIds\": [
    $ownerid
  ],
  \"GoogleApiKey\": \"$googleapi\",
  \"MashapeKey\": \"$mashapekey\",
  \"OsuApiKey\": \"$osu\",
  \"CleverbotApiKey\": \"$cleverbot\",
  \"TwitchClientId\": \"$twitchcid\",
  \"LocationIqApiKey\": \"$locationiqapi\",
  \"TimezoneDbApiKey\": \"$timedbapi\",
  \"Db\": null,
  \"TotalShards\": 1
}" | cat - >> credentials.json
echo Credentials setup completed.
sleep 5
clear
cd 
rm $HOME/n-credentials_setup.sh
exit 0
