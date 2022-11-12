# package:streamdeck

## A package for creating plugins for the Elgato Stream Deck.

Create actions that extend from `StreamDeckPluginAction` and a plugin class that extends `StreamDeckPlugin` to register them.

See the [example plugin](example/bin/main.dart) for some samples.

Implemented APIs:

| Direction | Event | Implemented? | Examples |
| --------- | ----- | ------------ | -------- |
| Receive | didReceiveSettings | |
| Receive | didReceiveGlobalSettings | |
| Receive | keyDown | ✅ | [counter](example/lib/counter.dart), [hold](example/lib/hold.dart) ([LongPressDetection](lib/src/mixins.dart)) |
| Receive | keyUp | ✅ | [hold](example/lib/hold.dart) ([LongPressDetection](lib/src/mixins.dart)) |
| Receive | willAppear | ✅ | [counter](example/lib/counter.dart), [clock](example/lib/clock.dart) |
| Receive | willDisappear | ✅ | [clock](example/lib/clock.dart) |
| Receive | titleParametersDidChange | |
| Receive | deviceDidConnect | |
| Receive | deviceDidDisconnect | |
| Receive | applicationDidLaunch | |
| Receive | applicationDidTerminate | |
| Receive | systemDidWakeUp | |
| Receive | propertyInspectorDidAppear | |
| Receive | propertyInspectorDidDisappear | |
| Receive | sendToPlugin | |
| Receive | sendToPropertyInspector | |
| Send | setSettings | |
| Send | getSettings | |
| Send | setGlobalSettings | |
| Send | getGlobalSettings | |
| Send | openUrl | |
| Send | logMessage | ✅ | [counter](example/lib/counter.dart)
| Send | setTitle | ✅ | [counter](example/lib/counter.dart), [clock](example/lib/clock.dart)
| Send | setImage | |
| Send | showAlert | ✅ | [hold](example/lib/hold.dart)
| Send | showOk | ✅ | [hold](example/lib/hold.dart)
| Send | setState | |
| Send | switchToProfile | |
| Send | sendToPropertyInspector | |
| Send | sendToPlugin | |
