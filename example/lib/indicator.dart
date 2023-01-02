import 'dart:math';

import 'package:streamdeck/streamdeck.dart';

/// A simple action that shows an indicator.
class IndicatorAction extends StreamDeckPluginAction {
  static const actionUuid = 'com.dantup.streamdeck.example.indicator';

  IndicatorAction(super.plugin, super.context);

  int _value = 42;

  void sendValue() => setFeedback({
    'value': _value.toString(),
    'indicator': _value.toString(),
  });

  @override
  void willAppear(WillAppearEvent event) {
    sendValue();
  }

  @override
  void dialRotate(DialRotateEvent event) {
    _value = max(0, min(100, _value + event.payload.ticks));
    sendValue();
  }

  @override
  void touchTap(TouchTapEvent event) {
    if (event.payload.hold) {
      _value = 42;
    } else {
      _value = 100;
    }
    sendValue();
  }

  @override
  void dialPress(DialPressEvent event) {
    _value = 0;
    sendValue();
  }
}
