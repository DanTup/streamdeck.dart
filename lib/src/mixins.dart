import 'dart:async';

import 'package:meta/meta.dart';
import 'package:streamdeck/streamdeck.dart';

/// Adds [shortPress] and [longPress] methods to allow an action to easily react
/// to longer presses.
///
/// Fires after [keyUp].
mixin LongPressDetection on StreamDeckPluginAction {
  int? _downTime;
  Timer? _longPressTimer;

  @override
  @mustCallSuper
  void keyDown(KeyDownEvent event) {
    super.keyDown(event);
    _downTime = DateTime.now().millisecondsSinceEpoch;
    _longPressTimer = Timer(const Duration(seconds: 1), () {
      _longPressTimer = null;
      longPress();
    });
  }

  @override
  @mustCallSuper
  void keyUp(KeyUpEvent event) {
    super.keyUp(event);
    final downTime = _downTime;

    if (downTime != null) {
      if (_longPressTimer != null) {
        _longPressTimer?.cancel();
        shortPress();
      }
    }
  }

  /// Called after a key is released and was held for less than a second.
  void shortPress();

  /// Called after a key was held for more than a second.
  void longPress();
}
