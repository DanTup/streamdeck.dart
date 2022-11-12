import 'package:streamdeck/streamdeck.dart';

class CounterAction extends StreamDeckPluginAction {
  static const actionUuid = 'com.dantup.streamdeck.counter';

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

     TODO: Persist with settings
  }

  void sendCount() async {
    setTitle(SetTitlePayload(title: _count.toString()));
  }

  @override
  void willAppear(WillAppearEvent event) => sendCount();
}
