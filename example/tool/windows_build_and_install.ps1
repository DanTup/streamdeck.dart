$PLUGINDIR = "$env:APPDATA\Elgato\StreamDeck\Plugins\com.dantup.streamdeck.examplePlugin.sdPlugin"

pushd (Split-Path -Parent $PSScriptRoot)

kill -Name "StreamDeck" -ErrorAction SilentlyContinue

mkdir -Force $PLUGINDIR
cp -Recurse -Force ./assets/* $PLUGINDIR/
dart compile exe bin/main.dart -o "$PLUGINDIR\plugin.exe"

start "C:\Program Files\Elgato\StreamDeck\StreamDeck.exe"

popd
