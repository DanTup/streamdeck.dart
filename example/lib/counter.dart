import 'package:streamdeck/streamdeck.dart';

/// A simple counter that increases each time the key is pressed.
///
/// Each instance contains its own count, so multiple instances of this action
/// will count independently.
class CounterAction extends StreamDeckPluginAction {
  static const actionUuid = 'com.dantup.streamdeck.example.counter';

  int _count = 0;

  CounterAction(super.plugin, super.context);

  @override
  void keyDown(KeyDownEvent event) {
    _count++;
    sendCount();

    if (_count % 10 == 0) {
      logMessage(LogMessagePayload(
          message: 'Counter for $context has reached $_count'));
    }

    // TODO: Persist with settings
  }

  void sendCount() async {
    setTitle(SetTitlePayload(title: _count.toString()));
  }

  @override
  void willAppear(WillAppearEvent event) => sendCount();
}
