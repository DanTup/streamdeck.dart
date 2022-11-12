library plugin;

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

/// The base class for a Stream Deck plugin that connects to the Stream Deck.
///
/// This class handles the WebSocket connection turning incoming events into
/// method calls and sends outgoing events.
abstract class StreamDeckPlugin {
  final String pluginUuid;
  final String _registerEvent;
  final ServiceInfo _info; // ignore: unused_field

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

  /// Called when a Stream Deck device is connected.
  void deviceDidConnect(DeviceDidConnectEvent event) {}

  /// Called when a Stream Deck device is disconnected.
  void deviceDidDisconnect(DeviceDidDisconnectEvent event) {}

  /// Called when a key on a Stream Deck is pressed down.
  void keyDown(KeyDownEvent event) {
    _actionContexts[event.context]?.keyDown(event);
  }

  /// Called when a key on a Stream Deck is pressed released.
  void keyUp(KeyUpEvent event) {
    _actionContexts[event.context]?.keyUp(event);
  }

  /// Writes a message to the plugins debug log ([logSink]).
  ///
  /// The debug log is used for a plugin to be able to write to its own log file
  /// (where all JSON traffic is recorded) for development/debugging purposes
  /// and is not sent to the Stream Decks main log file (see [logMessage] for
  /// that).
  void logDebug(String message) {
    _logSink?.writeln(message);
  }

  /// Logs a message to the plugins log file in the Stream Deck application.
  void logMessage(String context, LogMessagePayload payload) {
    _sendEvent(LogMessageEvent(context: context, payload: payload));
  }

  /// Registers the constructor for a [StreamDeckPluginAction] against its UUID.
  ///
  /// There will usually be a 1:1 mapping between actions listed in the
  /// manifest, calls to this method, and classes with [StreamDeckPluginAction]
  /// as a base.
  void registerAction(String actionUuid, ActionConstructor constructor) {
    _actionConstructors[actionUuid] = constructor;
  }

  /// Sends an arbitrary event to the StreamDeck.
  void _sendEvent(Event event) {
    _send(event.toJson());
  }

  /// Dynamically changes the title displayed by an instance of an action.
  void setTitle(String context, SetTitlePayload payload) {
    _sendEvent(SetTitleEvent(context: context, payload: payload));
  }

  /// Temporarily shows an alert icon on the image displayed by an instance of
  /// an action.
  void showAlert(String context) {
    _sendEvent(ShowAlertEvent(context: context));
  }

  /// Temporarily shows an OK checkmark icon on the image displayed by an
  /// instance of an action.
  void showOk(String context) {
    _sendEvent(ShowOkEvent(context: context));
  }

  /// Called when an instance of an action is about to be displayed on the
  /// Stream Deck.
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

  /// Called when an instance of an action is about to be removed from display
  /// on the Stream Deck.
  void willDisappear(WillDisappearEvent event) {
    _actionContexts[event.context]?.willDisappear(event);
  }

  void _handleSocketEvent(String jsonString) {
    logDebug('DECK-->PLUGIN: $jsonString');
    final data = jsonDecode(jsonString);
    if (data is Map<String, Object?>) {
      switch (data['event']) {
        case DeviceDidConnectEvent.eventId:
          return deviceDidConnect(DeviceDidConnectEvent.fromJson(data));
        case DeviceDidDisconnectEvent.eventId:
          return deviceDidDisconnect(DeviceDidDisconnectEvent.fromJson(data));
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
    logDebug('DECK<--PLUGIN: $jsonString');
    _socket.add(jsonString);
  }

  /// Connects to the Stream Deck application.
  ///
  /// This method should be called once by a plugin at startup and provided a
  /// [StreamDeckPlugin] constructor, the [arguments] passed to the process and
  /// optionally a [logSink] to record all JSON traffic to (plus any calls
  /// to [logDebug]).
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

  /// Called when a key on a Stream Deck is pressed down.
  void keyDown(KeyDownEvent event) {}

  /// Called when a key on a Stream Deck is pressed released.
  void keyUp(KeyUpEvent event) {}

  /// Writes a message to the plugins debug log.
  ///
  /// The debug log is used for a plugin to be able to write to its own log file
  /// (where all JSON traffic is recorded) for development/debugging purposes
  /// and is not sent to the Stream Decks main log file (see [logMessage] for
  /// that).
  void logDebug(String message) {
    plugin.logDebug(message);
  }

  /// Logs a message to the plugins log file in the Stream Deck application.
  void logMessage(LogMessagePayload payload) {
    plugin.logMessage(context, payload);
  }

  /// Dynamically changes the title displayed by an instance of an action.
  void setTitle(SetTitlePayload payload) {
    plugin.setTitle(context, payload);
  }

  /// Temporarily shows an alert icon on the image displayed by an instance of
  /// an action.
  void showAlert() {
    plugin.showAlert(context);
  }

  /// Temporarily shows an OK checkmark icon on the image displayed by an
  /// instance of an action.
  void showOk() {
    plugin.showOk(context);
  }

  /// Called when an instance of an action is about to be displayed on the
  /// Stream Deck.
  void willAppear(WillAppearEvent event) {}

  /// Called when an instance of an action is about to be removed from display
  /// on the Stream Deck.
  void willDisappear(WillDisappearEvent event) {}
}
