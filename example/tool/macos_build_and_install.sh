PLUGINDIR="$HOME/Library/Application Support/com.elgato.StreamDeck/Plugins/com.dantup.streamdeck.examplePlugin.sdPlugin"

pushd "${0%/*}/.." > /dev/null

pkill "Stream Deck"

mkdir -p "$PLUGINDIR"
cp -rf ./assets/ "$PLUGINDIR"
dart compile exe bin/main.dart -o "$PLUGINDIR/plugin"

open -a "Stream Deck"

popd > /dev/null


