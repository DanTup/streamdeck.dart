import 'package:streamdeck/streamdeck.dart';

/// An action that shows an "Ok" icon when held for more than one second, and
/// an "Alert" icon if held for less than one second.
///
/// Uses the [LongPressDetection] mixin.
class HoldAction extends StreamDeckPluginAction with LongPressDetection {
  static const actionUuid = 'com.dantup.streamdeck.example.hold';

  HoldAction(super.plugin, super.context);

  @override
  void shortPress() => showAlert();

  @override
  void longPress() => showOk();
}
