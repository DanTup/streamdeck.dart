import 'package:json_annotation/json_annotation.dart';

part 'protocol.g.dart';

/// Event received when a monitored application is launched.
///
/// A plugin can request in its `manifest.json` to be notified when some
/// applications are launched or terminated. The manifest.json should contain an
/// `ApplicationsToMonitor` object specifying the list of application
/// identifiers to monitor. On macOS, the application bundle identifier is used
/// while the exe filename is used on Windows.
@JsonSerializable()
class ApplicationDidLaunchEvent extends Event {
  static const eventId = 'applicationDidLaunch';

  final ApplicationPayload payload;

  ApplicationDidLaunchEvent({
    super.event = ApplicationDidLaunchEvent.eventId,
    required this.payload,
  });

  factory ApplicationDidLaunchEvent.fromJson(Map<String, Object?> json) =>
      _$ApplicationDidLaunchEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$ApplicationDidLaunchEventToJson(this);
}

/// Event received when a monitored application is terminated.
///
/// See [ApplicationDidLaunchEvent] for more information on monitoring
/// applications.
@JsonSerializable()
class ApplicationDidTerminateEvent extends Event {
  static const eventId = 'applicationDidTerminate';

  final ApplicationPayload payload;

  ApplicationDidTerminateEvent({
    super.event = ApplicationDidTerminateEvent.eventId,
    required this.payload,
  });

  factory ApplicationDidTerminateEvent.fromJson(Map<String, Object?> json) =>
      _$ApplicationDidTerminateEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$ApplicationDidTerminateEventToJson(this);
}

@JsonSerializable()
class ApplicationPayload extends Payload {
  final String application;

  ApplicationPayload({
    required this.application,
  });

  factory ApplicationPayload.fromJson(Map<String, Object?> json) =>
      _$ApplicationPayloadFromJson(json);

  Map<String, Object?> toJson() => _$ApplicationPayloadToJson(this);
}

abstract class CommonReceivedEvent extends Event {
  final String action;
  final String context;
  final String device;

  CommonReceivedEvent({
    required super.event,
    required this.action,
    required this.context,
    required this.device,
  });
}

@JsonSerializable()
class CommonReceivedPayload extends Payload {
  final Map<String, Object?> settings;
  final Coordinates coordinates;

  @JsonKey(includeIfNull: false)
  final int? state;

  CommonReceivedPayload({
    required this.settings,
    required this.coordinates,
    this.state,
  });

  factory CommonReceivedPayload.fromJson(Map<String, Object?> json) =>
      _$CommonReceivedPayloadFromJson(json);

  Map<String, Object?> toJson() => _$CommonReceivedPayloadToJson(this);
}

abstract class CommonSentEvent extends Event {
  final String context;

  CommonSentEvent({
    required super.event,
    required this.context,
  });
}

@JsonSerializable()
class ContextPayload extends CommonReceivedPayload {
  final bool isInMultiAction;

  ContextPayload({
    required super.settings,
    required super.coordinates,
    super.state,
    required this.isInMultiAction,
  });

  factory ContextPayload.fromJson(Map<String, Object?> json) =>
      _$ContextPayloadFromJson(json);

  @override
  Map<String, Object?> toJson() => _$ContextPayloadToJson(this);
}

/// Coordinates of the button on the device where this action was triggered.
@JsonSerializable()
class Coordinates {
  final int column;
  final int row;

  Coordinates({
    required this.column,
    required this.row,
  });

  factory Coordinates.fromJson(Map<String, Object?> json) =>
      _$CoordinatesFromJson(json);

  Map<String, Object?> toJson() => _$CoordinatesToJson(this);
}

/// Event received when a Stream Deck device is connected.
///
/// This event fires for all connected devices during startup/plugin
/// registration.
@JsonSerializable()
class DeviceDidConnectEvent extends Event {
  static const eventId = 'deviceDidConnect';

  final String device;
  final DeviceInfo deviceInfo;

  DeviceDidConnectEvent({
    super.event = DeviceDidConnectEvent.eventId,
    required this.device,
    required this.deviceInfo,
  });

  factory DeviceDidConnectEvent.fromJson(Map<String, Object?> json) =>
      _$DeviceDidConnectEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$DeviceDidConnectEventToJson(this);
}

/// Event received when a Stream Deck device is disconnected.
@JsonSerializable()
class DeviceDidDisconnectEvent extends Event {
  static const eventId = 'deviceDidDisconnect';

  final String device;

  DeviceDidDisconnectEvent({
    super.event = DeviceDidDisconnectEvent.eventId,
    required this.device,
  });

  factory DeviceDidDisconnectEvent.fromJson(Map<String, Object?> json) =>
      _$DeviceDidDisconnectEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$DeviceDidDisconnectEventToJson(this);
}

/// Information about a Stream Deck device.
@JsonSerializable()
class DeviceInfo {
  final String name;
  final int type;
  final DeviceSize size;

  DeviceInfo({
    required this.name,
    required this.type,
    required this.size,
  });

  factory DeviceInfo.fromJson(Map<String, Object?> json) =>
      _$DeviceInfoFromJson(json);

  Map<String, Object?> toJson() => _$DeviceInfoToJson(this);
}

/// The size (in columns and rows) of a Stream Deck device.
@JsonSerializable()
class DeviceSize {
  final int columns;
  final int rows;

  DeviceSize({
    required this.columns,
    required this.rows,
  });

  factory DeviceSize.fromJson(Map<String, Object?> json) =>
      _$DeviceSizeFromJson(json);

  Map<String, Object?> toJson() => _$DeviceSizeToJson(this);
}

/// Event received after calling the `getGlobalSettings` API to retrieve the
/// persistent data stored for the action.
///
/// Also received by the plugin after the Property Inspector calls the
/// `setGlobalSettings` API, and similarly by the Property Inspector when the
/// plugin calls the `setGlobalSettings` API.
@JsonSerializable()
class DidReceiveGlobalSettingsEvent extends Event {
  static const eventId = 'didReceiveSettings';

  final DidReceiveGlobalSettingsPayload payload;

  DidReceiveGlobalSettingsEvent({
    super.event = DidReceiveGlobalSettingsEvent.eventId,
    required this.payload,
  });

  factory DidReceiveGlobalSettingsEvent.fromJson(Map<String, Object?> json) =>
      _$DidReceiveGlobalSettingsEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$DidReceiveGlobalSettingsEventToJson(this);
}

@JsonSerializable()
class DidReceiveGlobalSettingsPayload extends Payload {
  final Map<String, Object?> settings;

  DidReceiveGlobalSettingsPayload({
    required this.settings,
  });

  factory DidReceiveGlobalSettingsPayload.fromJson(Map<String, Object?> json) =>
      _$DidReceiveGlobalSettingsPayloadFromJson(json);

  Map<String, Object?> toJson() =>
      _$DidReceiveGlobalSettingsPayloadToJson(this);
}

/// Event received after calling the `getSettings` API to retrieve the
/// persistent data stored for the action.
///
/// Also received by the plugin after the Property Inspector calls the
/// `setSettings` API, and similarly by the Property Inspector when the plugin
/// calls the `setSettings` API.
@JsonSerializable()
class DidReceiveSettingsEvent extends CommonReceivedEvent {
  static const eventId = 'didReceiveSettings';

  final ContextPayload payload;

  DidReceiveSettingsEvent({
    super.event = DidReceiveGlobalSettingsEvent.eventId,
    required super.action,
    required super.context,
    required super.device,
    required this.payload,
  });

  factory DidReceiveSettingsEvent.fromJson(Map<String, Object?> json) =>
      _$DidReceiveSettingsEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$DidReceiveSettingsEventToJson(this);
}

abstract class Event {
  final String event;

  Event({required this.event});

  Map<String, Object?> toJson();
}

/// An event sent to request that global settings are sent (via a
/// [DidReceiveGlobalSettingsEvent]).
@JsonSerializable()
class GetGlobalSettingsEvent extends CommonSentEvent {
  static const eventId = 'getGlobalSettings';

  GetGlobalSettingsEvent({
    super.event = GetGlobalSettingsEvent.eventId,
    required super.context,
  });

  factory GetGlobalSettingsEvent.fromJson(Map<String, Object?> json) =>
      _$GetGlobalSettingsEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$GetGlobalSettingsEventToJson(this);
}

/// An event sent to request that settings are sent (via a
/// [DidReceiveSettingsEvent]).
@JsonSerializable()
class GetSettingsEvent extends CommonSentEvent {
  static const eventId = 'getSettings';

  GetSettingsEvent({
    super.event = GetSettingsEvent.eventId,
    required super.context,
  });

  factory GetSettingsEvent.fromJson(Map<String, Object?> json) =>
      _$GetSettingsEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$GetSettingsEventToJson(this);
}

/// Event received when a key on a Stream Deck is pressed down.
@JsonSerializable()
class KeyDownEvent extends CommonReceivedEvent {
  static const eventId = 'keyDown';

  final KeyPayload payload;

  KeyDownEvent({
    super.event = KeyDownEvent.eventId,
    required super.action,
    required super.context,
    required super.device,
    required this.payload,
  });

  factory KeyDownEvent.fromJson(Map<String, Object?> json) =>
      _$KeyDownEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$KeyDownEventToJson(this);
}

@JsonSerializable()
class KeyPayload extends ContextPayload {
  @JsonKey(includeIfNull: false)
  final int? userDesiredState;

  KeyPayload({
    required super.settings,
    required super.coordinates,
    super.state,
    this.userDesiredState,
    required super.isInMultiAction,
  });

  factory KeyPayload.fromJson(Map<String, Object?> json) =>
      _$KeyPayloadFromJson(json);

  @override
  Map<String, Object?> toJson() => _$KeyPayloadToJson(this);
}

/// Event received when a key on a Stream Deck is pressed released.
@JsonSerializable()
class KeyUpEvent extends CommonReceivedEvent {
  static const eventId = 'keyUp';

  final KeyPayload payload;

  KeyUpEvent({
    super.event = KeyUpEvent.eventId,
    required super.action,
    required super.context,
    required super.device,
    required this.payload,
  });

  factory KeyUpEvent.fromJson(Map<String, Object?> json) =>
      _$KeyUpEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$KeyUpEventToJson(this);
}

/// Event sent to log a message to the plugins log file.
///
/// Logs are saved to disk per plugin in the folder `~/Library/Logs/StreamDeck/`
/// on macOS and `%appdata%\Elgato\StreamDeck\logs\` on Windows.
///
/// Note that the log files are rotated each time the Stream Deck application is
/// relaunched.
@JsonSerializable()
class LogMessageEvent extends CommonSentEvent {
  static const eventId = 'logMessage';

  final LogMessagePayload payload;

  LogMessageEvent({
    super.event = LogMessageEvent.eventId,
    required super.context,
    required this.payload,
  });

  factory LogMessageEvent.fromJson(Map<String, Object?> json) =>
      _$LogMessageEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$LogMessageEventToJson(this);
}

@JsonSerializable()
class LogMessagePayload extends Payload {
  final String message;

  LogMessagePayload({
    required this.message,
  });

  factory LogMessagePayload.fromJson(Map<String, Object?> json) =>
      _$LogMessagePayloadFromJson(json);

  Map<String, Object?> toJson() => _$LogMessagePayloadToJson(this);
}

/// An event sent to tell the Stream Deck application to open a URL in the
/// default browser.
@JsonSerializable()
class OpenUrlEvent extends CommonSentEvent {
  static const eventId = 'openUrl';

  final OpenUrlPayload payload;

  OpenUrlEvent({
    super.event = OpenUrlEvent.eventId,
    required super.context,
    required this.payload,
  });

  factory OpenUrlEvent.fromJson(Map<String, Object?> json) =>
      _$OpenUrlEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$OpenUrlEventToJson(this);
}

@JsonSerializable()
class OpenUrlPayload extends Payload {
  final String url;

  OpenUrlPayload({
    required this.url,
  });

  factory OpenUrlPayload.fromJson(Map<String, Object?> json) =>
      _$OpenUrlPayloadFromJson(json);

  Map<String, Object?> toJson() => _$OpenUrlPayloadToJson(this);
}

abstract class Payload {}

/// Event received when the Property Inspector appears in the Stream Deck user
/// interface, for example when selecting a new instance.
@JsonSerializable()
class PropertyInspectorDidAppearEvent extends CommonReceivedEvent {
  static const eventId = 'propertyInspectorDidAppear';

  PropertyInspectorDidAppearEvent({
    super.event = PropertyInspectorDidAppearEvent.eventId,
    required super.action,
    required super.context,
    required super.device,
  });

  factory PropertyInspectorDidAppearEvent.fromJson(Map<String, Object?> json) =>
      _$PropertyInspectorDidAppearEventFromJson(json);

  @override
  Map<String, Object?> toJson() =>
      _$PropertyInspectorDidAppearEventToJson(this);
}

/// Event received when the Property Inspector is removed from the Stream Deck
/// user interface, for example when selecting a different instance.
@JsonSerializable()
class PropertyInspectorDidDisappearEvent extends CommonReceivedEvent {
  static const eventId = 'propertyInspectorDidDisappear';

  PropertyInspectorDidDisappearEvent({
    super.event = PropertyInspectorDidDisappearEvent.eventId,
    required super.action,
    required super.context,
    required super.device,
  });

  factory PropertyInspectorDidDisappearEvent.fromJson(
          Map<String, Object?> json) =>
      _$PropertyInspectorDidDisappearEventFromJson(json);

  @override
  Map<String, Object?> toJson() =>
      _$PropertyInspectorDidDisappearEventToJson(this);
}

/// An event sent by the Property Inspector to the plugin.
@JsonSerializable()
class SendToPluginEvent extends CommonReceivedEvent {
  static const eventId = 'sendToPlugin';

  final Map<String, Object?> payload;

  SendToPluginEvent({
    super.event = SendToPluginEvent.eventId,
    required super.action,
    required super.context,
    required super.device,
    required this.payload,
  });

  factory SendToPluginEvent.fromJson(Map<String, Object?> json) =>
      _$SendToPluginEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$SendToPluginEventToJson(this);
}

/// An event sent by the plugin to the Property Inspector.
@JsonSerializable()
class SendToPropertyInspectorEvent extends CommonReceivedEvent {
  static const eventId = 'sendToPropertyInspector';

  final Map<String, Object?> payload;

  SendToPropertyInspectorEvent({
    super.event = SendToPropertyInspectorEvent.eventId,
    required super.action,
    required super.context,
    required super.device,
    required this.payload,
  });

  factory SendToPropertyInspectorEvent.fromJson(Map<String, Object?> json) =>
      _$SendToPropertyInspectorEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$SendToPropertyInspectorEventToJson(this);
}

/// Information about the Stream Deck application and connected Stream Decks
/// provided when the plugin process is started.
@JsonSerializable()
class ServiceInfo {
  ServiceInfo();

  factory ServiceInfo.fromJson(Map<String, Object?> json) =>
      _$ServiceInfoFromJson(json);

  Map<String, Object?> toJson() => _$ServiceInfoToJson(this);
}

/// An event sent to persistent data globally.
///
/// The data will be saved securely to the Keychain on macOS and the Credential
/// Store on Windows. This API can be used to save tokens that should be
/// available to every action in the plugin.
@JsonSerializable()
class SetGlobalSettingsEvent extends CommonSentEvent {
  static const eventId = 'setGlobalSettings';

  final Map<String, Object?> payload;

  SetGlobalSettingsEvent({
    super.event = SetGlobalSettingsEvent.eventId,
    required super.context,
    required this.payload,
  });

  factory SetGlobalSettingsEvent.fromJson(Map<String, Object?> json) =>
      _$SetGlobalSettingsEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$SetGlobalSettingsEventToJson(this);
}

/// Event sent to dynamically change the image displayed by an instance of an
/// action.
@JsonSerializable()
class SetImageEvent extends CommonSentEvent {
  static const eventId = 'setImage';

  final SetImagePayload payload;

  SetImageEvent({
    super.event = SetImageEvent.eventId,
    required super.context,
    required this.payload,
  });

  factory SetImageEvent.fromJson(Map<String, Object?> json) =>
      _$SetImageEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$SetImageEventToJson(this);
}

@JsonSerializable()
class SetImagePayload extends Payload {
  final String image;

  @JsonKey(includeIfNull: false)
  final Target? target;

  @JsonKey(includeIfNull: false)
  final int? state;

  SetImagePayload({
    required this.image,
    this.target,
    this.state,
  });

  factory SetImagePayload.fromJson(Map<String, Object?> json) =>
      _$SetImagePayloadFromJson(json);

  Map<String, Object?> toJson() => _$SetImagePayloadToJson(this);
}

/// An event sent to persistent data for an actions instance.
@JsonSerializable()
class SetSettingsEvent extends CommonSentEvent {
  static const eventId = 'setSettings';

  final Map<String, Object?> payload;

  SetSettingsEvent({
    super.event = SetSettingsEvent.eventId,
    required super.context,
    required this.payload,
  });

  factory SetSettingsEvent.fromJson(Map<String, Object?> json) =>
      _$SetSettingsEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$SetSettingsEventToJson(this);
}

/// Event sent to change the active state of an action supporting multiple
/// states.
@JsonSerializable()
class SetStateEvent extends CommonSentEvent {
  static const eventId = 'setState';

  final SetStatePayload payload;

  SetStateEvent({
    super.event = SetStateEvent.eventId,
    required super.context,
    required this.payload,
  });

  factory SetStateEvent.fromJson(Map<String, Object?> json) =>
      _$SetStateEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$SetStateEventToJson(this);
}

/// Event send to dynamically change the state of an action supporting multiple
/// states.
@JsonSerializable()
class SetStatePayload extends Payload {
  final int state;

  SetStatePayload({
    required this.state,
  });

  factory SetStatePayload.fromJson(Map<String, Object?> json) =>
      _$SetStatePayloadFromJson(json);

  Map<String, Object?> toJson() => _$SetStatePayloadToJson(this);
}

/// Event sent to dynamically change the title displayed by an instance of an
/// action.
@JsonSerializable()
class SetTitleEvent extends CommonSentEvent {
  static const eventId = 'setTitle';

  final SetTitlePayload payload;

  SetTitleEvent({
    super.event = SetTitleEvent.eventId,
    required super.context,
    required this.payload,
  });

  factory SetTitleEvent.fromJson(Map<String, Object?> json) =>
      _$SetTitleEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$SetTitleEventToJson(this);
}

@JsonSerializable()
class SetTitlePayload extends Payload {
  final String title;

  @JsonKey(includeIfNull: false)
  final Target? target;

  @JsonKey(includeIfNull: false)
  final int? state;

  SetTitlePayload({
    required this.title,
    this.target,
    this.state,
  });

  factory SetTitlePayload.fromJson(Map<String, Object?> json) =>
      _$SetTitlePayloadFromJson(json);

  Map<String, Object?> toJson() => _$SetTitlePayloadToJson(this);
}

/// Event sent to temporarily show an alert icon on the image displayed by an
/// instance of an action.
@JsonSerializable()
class ShowAlertEvent extends CommonSentEvent {
  static const eventId = 'showAlert';

  ShowAlertEvent({
    super.event = ShowAlertEvent.eventId,
    required super.context,
  });

  factory ShowAlertEvent.fromJson(Map<String, Object?> json) =>
      _$ShowAlertEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$ShowAlertEventToJson(this);
}

/// Event sent to temporarily show an OK checkmark icon on the image displayed
/// by an instance of an action.
@JsonSerializable()
class ShowOkEvent extends CommonSentEvent {
  static const eventId = 'showOk';

  ShowOkEvent({
    super.event = ShowOkEvent.eventId,
    required super.context,
  });

  factory ShowOkEvent.fromJson(Map<String, Object?> json) =>
      _$ShowOkEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$ShowOkEventToJson(this);
}

/// Event sent to switch the Stream Deck to a read-only profile preconfigured by
/// the plugin.
@JsonSerializable()
class SwitchToProfileEvent extends CommonSentEvent {
  static const eventId = 'switchToProfile';

  final String device;
  final SwitchToProfilePayload payload;

  SwitchToProfileEvent({
    super.event = SwitchToProfileEvent.eventId,
    required super.context,
    required this.device,
    required this.payload,
  });

  factory SwitchToProfileEvent.fromJson(Map<String, Object?> json) =>
      _$SwitchToProfileEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$SwitchToProfileEventToJson(this);
}

@JsonSerializable()
class SwitchToProfilePayload extends Payload {
  final String profile;

  SwitchToProfilePayload({
    required this.profile,
  });

  factory SwitchToProfilePayload.fromJson(Map<String, Object?> json) =>
      _$SwitchToProfilePayloadFromJson(json);

  Map<String, Object?> toJson() => _$SwitchToProfilePayloadToJson(this);
}

/// Event received when the computer wakes up.
@JsonSerializable()
class SystemDidWakeUpEvent extends Event {
  static const eventId = 'systemDidWakeUp';

  SystemDidWakeUpEvent({
    super.event = SystemDidWakeUpEvent.eventId,
  });

  factory SystemDidWakeUpEvent.fromJson(Map<String, Object?> json) =>
      _$SystemDidWakeUpEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$SystemDidWakeUpEventToJson(this);
}

/// The target for a setTitle/setImage request indicating where the title/image
/// should be updated.
enum Target {
  /// Update both software and hardware.
  @JsonValue(0)
  all,

  /// Update only on the Stream Deck hardware device.
  @JsonValue(1)
  hardware,

  /// Update only in the Stream Deck software.
  @JsonValue(2)
  software,
}

/// Alignment for a title.
enum TitleAlignment {
  top,
  bottom,
  middle,
}

/// Parameters that control how a title is displayed.
@JsonSerializable()
class TitleParameters {
  final String fontFamily;
  final int fontSize;
  final String fontStyle;
  final bool fontUnderline;
  final bool showTitle;
  final TitleAlignment titleAlignment;
  final String titleColor;

  TitleParameters({
    required this.fontFamily,
    required this.fontSize,
    required this.fontStyle,
    required this.fontUnderline,
    required this.showTitle,
    required this.titleAlignment,
    required this.titleColor,
  });

  factory TitleParameters.fromJson(Map<String, Object?> json) =>
      _$TitleParametersFromJson(json);

  Map<String, Object?> toJson() => _$TitleParametersToJson(this);
}

/// Event received when the user changes the title or title parameters.
@JsonSerializable()
class TitleParametersDidChangeEvent extends CommonReceivedEvent {
  static const eventId = 'titleParametersDidChange';

  final TitleParametersDidChangePayload payload;

  TitleParametersDidChangeEvent({
    super.event = TitleParametersDidChangeEvent.eventId,
    required super.action,
    required super.context,
    required super.device,
    required this.payload,
  });

  factory TitleParametersDidChangeEvent.fromJson(Map<String, Object?> json) =>
      _$TitleParametersDidChangeEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$TitleParametersDidChangeEventToJson(this);
}

@JsonSerializable()
class TitleParametersDidChangePayload extends CommonReceivedPayload {
  final String title;
  final TitleParameters titleParameters;

  TitleParametersDidChangePayload({
    required super.settings,
    required super.coordinates,
    super.state,
    required this.title,
    required this.titleParameters,
  });

  factory TitleParametersDidChangePayload.fromJson(Map<String, Object?> json) =>
      _$TitleParametersDidChangePayloadFromJson(json);

  @override
  Map<String, Object?> toJson() =>
      _$TitleParametersDidChangePayloadToJson(this);
}

/// Event received when an instance of an action is about to be displayed on the
/// Stream Deck.
///
/// This can occur when:
///
/// - A device is connected
/// - The Stream Deck application is started
/// - The user adds the action to a key
/// - The user switches to a profile that contains instances of an action
@JsonSerializable()
class WillAppearEvent extends CommonReceivedEvent {
  static const eventId = 'willAppear';

  final ContextPayload payload;

  WillAppearEvent({
    super.event = WillAppearEvent.eventId,
    required super.action,
    required super.context,
    required super.device,
    required this.payload,
  });

  factory WillAppearEvent.fromJson(Map<String, Object?> json) =>
      _$WillAppearEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$WillAppearEventToJson(this);
}

/// Event received when an instance of an action is about to be removed from
/// display on the Stream Deck.
///
/// This can occur when:
///
/// - The user removes the action from a key
/// - The user switches to another profile
@JsonSerializable()
class WillDisappearEvent extends CommonReceivedEvent {
  static const eventId = 'willDisappear';

  final ContextPayload payload;

  WillDisappearEvent({
    super.event = WillDisappearEvent.eventId,
    required super.action,
    required super.context,
    required super.device,
    required this.payload,
  });

  factory WillDisappearEvent.fromJson(Map<String, Object?> json) =>
      _$WillDisappearEventFromJson(json);

  @override
  Map<String, Object?> toJson() => _$WillDisappearEventToJson(this);
}
