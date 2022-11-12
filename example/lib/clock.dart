import 'dart:async';

import 'package:streamdeck/streamdeck.dart';

class ClockAction extends StreamDeckPluginAction {
  static const actionUuid = 'com.dantup.streamdeck.clock';

  Timer? _timer;

  ClockAction(super.plugin, super.context);

  void sendTime() async {
    final time = DateTime.now();
    final timeString = [
      time.hour,
      time.minute,
      time.second,
    ].map(_pad).join(':');
    setTitle(SetTitlePayload(title: timeString));
  }

  @override
  void willAppear(WillAppearEvent event) {
    sendTime();
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (_) => sendTime(),
    );
  }

  @override
  void willDisappear(WillDisappearEvent event) => _timer?.cancel();

  String _pad(Object s) => s.toString().padLeft(2, '0');
}
