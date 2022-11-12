# package:streamdeck

## A Dart package for building plugins for the Elgato Stream Deck in Dart.

Create actions that extend from `StreamDeckPluginAction` and a plugin class that extends `StreamDeckPlugin` to register them.

See the [example plugin] for some samples.

Implemented APIs:

| Direction | Event | Implemented? | Examples |
| --------- | ----- | ------------ | -------- |
| Receive | didReceiveSettings | |
| Receive | didReceiveGlobalSettings | |
| Receive | keyDown | ✅ | [counter], [hold] ([LongPressDetection]) |
| Receive | keyUp | ✅ | [hold] ([LongPressDetection]) |
| Receive | willAppear | ✅ | [counter], [clock] |
| Receive | willDisappear | ✅ | [clock] |
| Receive | titleParametersDidChange | |
| Receive | deviceDidConnect | ✅ |
| Receive | deviceDidDisconnect | ✅ |
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
| Send | logMessage | ✅ | [counter]
| Send | setTitle | ✅ | [counter], [clock]
| Send | setImage | |
| Send | showAlert | ✅ | [hold]
| Send | showOk | ✅ | [hold]
| Send | setState | |
| Send | switchToProfile | |
| Send | sendToPropertyInspector | |
| Send | sendToPlugin | |

[example plugin]: https://github.com/DanTup/streamdeck.dart/blob/main/example/
[counter]: https://github.com/DanTup/streamdeck.dart/blob/main/example/lib/counter.dart
[clock]: https://github.com/DanTup/streamdeck.dart/blob/main/example/lib/clock.dart
[hold]: https://github.com/DanTup/streamdeck.dart/blob/main/example/lib/hold.dart
[LongPressDetection]: https://github.com/DanTup/streamdeck.dart/blob/main/lib/src/mixins.dart
