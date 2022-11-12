import 'dart:convert';
import 'dart:io';

import 'package:streamdeck/src/protocol.dart';

typedef ActionConstructor = StreamDeckPluginAction Function(
  StreamDeckPlugin plugin,
  String context,
);

typedef PluginConstructor<T extends StreamDeckPlugin> = T Function({
  required WebSocket socket,
  required String pluginUuid,
  required String registerEvent,
  required ServiceInfo info,
  IOSink? logSink,
});

abstract class StreamDeckPlugin {
  final String pluginUuid;
  final String _registerEvent;
  final ServiceInfo _info;

  final IOSink? _logSink;
  final WebSocket _socket;

  final _actionConstructors = <String, ActionConstructor>{};
  final _actionContexts = <String, StreamDeckPluginAction>{};

  StreamDeckPlugin({
    required WebSocket socket,
    required this.pluginUuid,
    required String registerEvent,
    required ServiceInfo info,
    IOSink? logSink,
  })  : _socket = socket,
        _registerEvent = registerEvent,
        _info = info,
        _logSink = logSink {
    _socket.listen((data) => _handleSocketEvent(data));
    _send({"event": _registerEvent, "uuid": pluginUuid});
  }

  Future<void> get done => _socket.done;

  void deviceDidConnect(DeviceDidConnectEvent event) {}

  void keyDown(KeyDownEvent event) {
    _actionContexts[event.context]?.keyDown(event);
  }

  void keyUp(KeyUpEvent event) {
    _actionContexts[event.context]?.keyUp(event);
  }

  void log(String message) {
    _logSink?.writeln(message);
  }

  void logMessage(String context, LogMessagePayload payload) {
    sendEvent(LogMessageEvent(context: context, payload: payload));
  }

  void registerAction(String actionUuid, ActionConstructor constructor) {
    _actionConstructors[actionUuid] = constructor;
  }

  void sendEvent(Event event) {
    _send(event.toJson());
  }

  void setTitle(String context, SetTitlePayload payload) {
    sendEvent(SetTitleEvent(context: context, payload: payload));
  }

  void showAlert(String context) {
    sendEvent(ShowAlertEvent(context: context));
  }

  void showOk(String context) {
    sendEvent(ShowOkEvent(context: context));
  }

  void willAppear(WillAppearEvent event) {
    final constructor = _actionConstructors[event.action];
    if (constructor != null) {
      final action = _actionContexts.putIfAbsent(
        event.context,
        () => constructor(this, event.context),
      );
      action.willAppear(event);
    }
  }

  void willDisappear(WillDisappearEvent event) {
    _actionContexts[event.context]?.willDisappear(event);
  }

  void _handleSocketEvent(String jsonString) {
    log('DECK-->PLUGIN: $jsonString');
    final data = jsonDecode(jsonString);
    if (data is Map<String, Object?>) {
      switch (data['event']) {
        case DeviceDidConnectEvent.eventId:
          return deviceDidConnect(DeviceDidConnectEvent.fromJson(data));
        case KeyDownEvent.eventId:
          return keyDown(KeyDownEvent.fromJson(data));
        case KeyUpEvent.eventId:
          return keyUp(KeyUpEvent.fromJson(data));
        case WillAppearEvent.eventId:
          return willAppear(WillAppearEvent.fromJson(data));
        case WillDisappearEvent.eventId:
          return willDisappear(WillDisappearEvent.fromJson(data));
        default:
      }
    }
  }

  void _send(Map<String, Object?> data) {
    final jsonString = jsonEncode(data);
    log('DECK<--PLUGIN: $jsonString');
    _socket.add(jsonString);
  }

  static Future<T> connect<T extends StreamDeckPlugin>(
    PluginConstructor<T> constructor,
    List<String> arguments, {
    IOSink? logSink,
  }) async {
    final port = int.parse(arguments[arguments.indexOf('-port') + 1]);
    final pluginUuid = arguments[arguments.indexOf('-pluginUUID') + 1];
    final registerEvent = arguments[arguments.indexOf('-registerEvent') + 1];
    final info = ServiceInfo.fromJson(
      jsonDecode(arguments[arguments.indexOf('-info') + 1]),
    );

    final socket = await WebSocket.connect('ws://localhost:$port');

    return constructor(
      socket: socket,
      pluginUuid: pluginUuid,
      registerEvent: registerEvent,
      info: info,
      logSink: logSink,
    );
  }
}

abstract class StreamDeckPluginAction<T extends StreamDeckPlugin> {
  final String context;

  final T plugin;
  StreamDeckPluginAction(this.plugin, this.context);

  void keyDown(KeyDownEvent event) {}

  void keyUp(KeyUpEvent event) {}

  void logMessage(LogMessagePayload payload) {
    plugin.logMessage(context, payload);
  }

  void setTitle(SetTitlePayload payload) {
    plugin.setTitle(context, payload);
  }

  void showAlert() {
    plugin.showAlert(context);
  }

  void showOk() {
    plugin.showOk(context);
  }

  void willAppear(WillAppearEvent event) {}

  void willDisappear(WillDisappearEvent event) {}
}
