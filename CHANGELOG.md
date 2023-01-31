## 0.3.0 _2023-01-31_

- Add support for StreamDeck+:
  - `touchTap` support
  - `dialPress` support
  - `dialRotate` support
  - `setFeedback` support
  - `setFeedbackLayout` support
- Fire `longPress` when using the `LongPressDetection` mixin after 1 second, instead of only when the button is released
- Add new `indicator` and `image` examples
- Wire up missing handlers for `DidReceiveSettingsEvent`, `DidReceiveGlobalSettingsEvent`, `ApplicationDidLaunchEvent`, `ApplicationDidTerminateEvent`

## 0.2.0 _2022-11-25_

- `didReceiveSettings` support
- `didReceiveGlobalSettings` support
- `applicationDidLaunch` support
- `applicationDidTerminate` support
- `systemDidWakeUp` support
- `propertyInspectorDidAppear` support
- `propertyInspectorDidDisappear` support
- `setSettings` support
- `getSettings` support
- `setGlobalSettings` support
- `getGlobalSettings` support
- `openUrl` support
- `setState` support
- `switchToProfile` support
- `showImage` support and a `getImageAsset` helper on `StreamDeckPlugin` for reading image assets into the required form for `showImage`

## 0.1.2 _(2022-11-12)_

- Add documentation to main classes and methods (no functional changes)

## 0.1.1 _(2022-11-12)_

- Address some issues flagged by `package:pana` (no functional changes)

## 0.1.0 _(2022-11-12)_

- Initial release with basic plugin support
- `deviceDidConnect` support
- `deviceDidDisconnect` support
- `willAppear` support
- `willDisappear` support
- `keyUp` support
- `keyDown` support
- `logMessage` support
- `setTitle` support
- `showAlert` support
- `showOk` support
