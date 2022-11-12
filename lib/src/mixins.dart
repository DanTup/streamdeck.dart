import 'package:meta/meta.dart';
import 'package:streamdeck/streamdeck.dart';

/// Adds [shortPress] and [longPress] methods to allow an action to easily react
/// to longer presses.
///
/// Fires after [keyUp].
mixin LongPressDetection on StreamDeckPluginAction {
  int? _downTime;

  @override
  @mustCallSuper
  void keyDown(KeyDownEvent event) {
    super.keyDown(event);
    _downTime = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  @mustCallSuper
  void keyUp(KeyUpEvent event) {
    super.keyUp(event);
    final downTime = _downTime;

    if (downTime != null &&
        DateTime.now().millisecondsSinceEpoch - downTime > 1000) {
      longPress();
    } else {
      shortPress();
    }
  }

  void shortPress();
  void longPress();
}
