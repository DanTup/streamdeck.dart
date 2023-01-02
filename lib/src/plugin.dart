library plugin;

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
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

  /// Called received when a monitored application is launched.
  void applicationDidLaunch(ApplicationDidLaunchEvent event) {}

  /// Called received when a monitored application is terminated.
  void applicationDidTerminate(ApplicationDidTerminateEvent event) {}

  /// Called when a Stream Deck device is connected.
  void deviceDidConnect(DeviceDidConnectEvent event) {}

  /// Called when a Stream Deck device is disconnected.
  void deviceDidDisconnect(DeviceDidDisconnectEvent event) {}

  /// Called after the [getGlobalSettings] API was called by an action.
  ///
  /// Also called on the plugin after the Property Inspector calls the
  /// [setGlobalSettings] API, and similarly on the Property Inspector when the
  /// plugin calls the [setGlobalSettings] API.
  void didReceiveGlobalSettings(DidReceiveGlobalSettingsEvent event) {}

  /// Called after the [getSettings] API was called by an action.
  ///
  /// Also called on the plugin after the Property Inspector calls the
  /// [setSettings] API, and similarly on the Property Inspector when the plugin
  /// calls the [setSettings] API.
  void didReceiveSettings(DidReceiveSettingsEvent event) {
    _actionContexts[event.context]?.didReceiveSettings(event);
  }

  /// Requests settings data for all actions.
  ///
  /// Settings will be returned via [didReceiveGlobalSettings].
  void getGlobalSettings() {
    _sendEvent(GetGlobalSettingsEvent(context: pluginUuid));
  }

  /// Requests settings data for an action.
  ///
  /// Settings will be returned via [didReceiveSettings].
  void getSettings(String context) {
    _sendEvent(GetSettingsEvent(context: context));
  }

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

  /// Tells the Stream Deck application to open an URL in the default browser.
  void openUrl(String context, OpenUrlPayload payload) {
    _sendEvent(OpenUrlEvent(context: context, payload: payload));
  }

  /// Called when the Property Inspector appears in the Stream Deck user
  /// interface, for example when selecting a new instance.
  void propertyInspectorDidAppear(PropertyInspectorDidAppearEvent event) {
    _actionContexts[event.context]?.propertyInspectorDidAppear(event);
  }

  /// Called when the Property Inspector is removed from the Stream Deck
  /// user interface, for example when selecting a different instance.
  void propertyInspectorDidDisappear(PropertyInspectorDidDisappearEvent event) {
    _actionContexts[event.context]?.propertyInspectorDidDisappear(event);
  }

  /// Registers the constructor for a [StreamDeckPluginAction] against its UUID.
  ///
  /// There will usually be a 1:1 mapping between actions listed in the
  /// manifest, calls to this method, and classes with [StreamDeckPluginAction]
  /// as a base.
  void registerAction(String actionUuid, ActionConstructor constructor) {
    _actionConstructors[actionUuid] = constructor;
  }

  /// Persists settings data that is available to all actions globally.
  void setGlobalSettings(Map<String, Object?> payload) {
    _sendEvent(SetGlobalSettingsEvent(context: pluginUuid, payload: payload));
  }

  /// Switches Stream Deck to a read-only profile preconfigured by the plugin.
  void switchToProfile(String device, SwitchToProfilePayload payload) {
    _sendEvent(SwitchToProfileEvent(
        device: device, context: pluginUuid, payload: payload));
  }

  /// Persists settings data that is available to a single action.
  void setSettings(String context, Map<String, Object?> payload) {
    _sendEvent(SetSettingsEvent(context: context, payload: payload));
  }

  /// Dynamically changes the state of an action supporting multiple states
  void setState(String context, SetStatePayload payload) {
    _sendEvent(SetStateEvent(context: context, payload: payload));
  }

  /// Dynamically changes the title displayed by an instance of an action.
  void setTitle(String context, SetTitlePayload payload) {
    _sendEvent(SetTitleEvent(context: context, payload: payload));
  }

  /// Dynamically changes the image displayed by an instance of an action.
  void setImage(String context, SetImagePayload payload) {
    _sendEvent(SetImageEvent(context: context, payload: payload));
  }

  /// Dynamically changes the properties of items on the touch display
  /// (StreamDeck+ only).
  void setFeedback(String context, SetFeedbackPayload payload) {
    _sendEvent(SetFeedbackEvent(context: context, payload: payload));
  }

  /// Dynamically changes the touch display layout (StreamDeck+ only).
  void setFeedbackLayout(String context, SetFeedbackLayoutPayload payload) {
    _sendEvent(SetFeedbackLayoutEvent(context: context, payload: payload));
  }

  /// Returns the image named [filename] in the plugin folder as a base64 string
  /// formatted for [setImage].
  ///
  /// Only PNG, JPEG, BMP and SVGs are supported.
  String getImageAsset(String filename) {
    final image = File(filename);
    var ext = path.extension(filename);
    if (ext.isNotEmpty) {
      ext = ext.substring(1);
    }

    if (ext == 'svg') {
      final textContents = image.readAsStringSync();
      return 'data:image/svg+xml;charset=utf8,$textContents';
    }

    final bytes = image.readAsBytesSync();
    final base64 = base64Encode(bytes);
    return 'data:image/$ext;base64,$base64';
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

  /// Called when the computer wakes up.
  void systemDidWakeUp(SystemDidWakeUpEvent event) {}

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

  /// Called when the user touches the display (StreamDeck+ only).
  void touchTap(TouchTapEvent event) {
    _actionContexts[event.context]?.touchTap(event);
  }

  /// Called when the user presses or releases the encoder (StreamDeck+ only).
  void dialPress(DialPressEvent event) {
    _actionContexts[event.context]?.dialPress(event);
  }

  /// Called when the user rotates the encoder (StreamDeck+ only).
  void dialRotate(DialRotateEvent event) {
    _actionContexts[event.context]?.dialRotate(event);
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
        case TouchTapEvent.eventId:
          return touchTap(TouchTapEvent.fromJson(data));
        case DialPressEvent.eventId:
          return dialPress(DialPressEvent.fromJson(data));
        case DialRotateEvent.eventId:
          return dialRotate(DialRotateEvent.fromJson(data));
        default:
      }
    }
  }

  void _send(Map<String, Object?> data) {
    final jsonString = jsonEncode(data);
    logDebug('DECK<--PLUGIN: $jsonString');
    _socket.add(jsonString);
  }

  /// Sends an arbitrary event to the StreamDeck.
  void _sendEvent(Event event) {
    _send(event.toJson());
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

  /// Called after the [getSettings] API was called by an action.
  ///
  /// Also called on the plugin after the Property Inspector calls the
  /// [setSettings] API, and similarly on the Property Inspector when the plugin
  /// calls the [setSettings] API.
  void didReceiveSettings(DidReceiveSettingsEvent event) {}

  /// Requests settings data for an action.
  ///
  /// Settings will be returned via [didReceiveSettings].
  void getSettings() {
    plugin.getSettings(context);
  }

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

  /// Tells the Stream Deck application to open an URL in the default browser.
  void openUrl(OpenUrlPayload payload) {
    plugin.openUrl(context, payload);
  }

  /// Called when the Property Inspector appears in the Stream Deck user
  /// interface, for example when selecting a new instance.
  void propertyInspectorDidAppear(PropertyInspectorDidAppearEvent event) {}

  /// Called when the Property Inspector is removed from the Stream Deck
  /// user interface, for example when selecting a different instance.
  void propertyInspectorDidDisappear(
      PropertyInspectorDidDisappearEvent event) {}

  /// Persists settings data that is available to an action.
  void setSettings(Map<String, Object?> payload) {
    plugin.setSettings(context, payload);
  }

  /// Dynamically changes the state of an action.
  void setState(SetStatePayload payload) {
    plugin.setState(context, payload);
  }

  /// Dynamically changes the title displayed by an instance of an action.
  void setTitle(SetTitlePayload payload) {
    plugin.setTitle(context, payload);
  }

  /// Dynamically changes the image displayed by an instance of an action.
  void setImage(SetImagePayload payload) {
    plugin.setImage(context, payload);
  }

  /// Dynamically changes the properties of items on the touch display
  /// (StreamDeck+ only).
  void setFeedback(SetFeedbackPayload payload) {
    plugin.setFeedback(context, payload);
  }

  /// Dynamically changes the touch display layout (StreamDeck+ only).
  void setFeedbackLayout(SetFeedbackLayoutPayload payload) {
    plugin.setFeedbackLayout(context, payload);
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

  /// Called when the user touches the display (StreamDeck+ only).
  void touchTap(TouchTapEvent event) {}

  /// Called when the user presses or releases the encoder (StreamDeck+ only).
  void dialPress(DialPressEvent event) {}

  /// Called when the user rotates the encoder (StreamDeck+ only).
  void dialRotate(DialRotateEvent event) {}
}
