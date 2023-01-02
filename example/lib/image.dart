import 'dart:convert';
import 'dart:math';

import 'package:image/image.dart' as img;
import 'package:streamdeck/streamdeck.dart';

/// A simple action that shows an image.
class ImageAction extends StreamDeckPluginAction {
  static const actionUuid = 'com.dantup.streamdeck.example.image';

  ImageAction(super.plugin, super.context);

  var _xPos = 0;

  @override
  void willAppear(WillAppearEvent event) {
    _draw();
  }

  void _draw() {
    final canvas = img.Image(width: 200, height: 100);
    img.fillCircle(
      canvas,
      radius: 20,
      x: _xPos + 50,
      y: 50,
      color: img.ColorRgba8(180, 0, 80, 255),
    );
    img.drawString(canvas, 'hello world', font: img.arial24);

    setFeedback({
      'title': '',
      "full-canvas": "data:image/png;base64,"
          "${base64Encode(img.encodePng(canvas))}"
    });
  }

  @override
  void dialRotate(DialRotateEvent event) {
    _xPos = max(-50, min(150, _xPos + event.payload.ticks * 3));
    _draw();
  }

  @override
  void dialPress(DialPressEvent event) {
    _xPos = 0;
    _draw();
  }
}
