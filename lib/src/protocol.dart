import 'package:json_annotation/json_annotation.dart';

part 'protocol.g.dart';

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

@JsonSerializable()
class ServiceInfo {
  ServiceInfo();
  factory ServiceInfo.fromJson(Map<String, Object?> json) =>
      _$ServiceInfoFromJson(json);

  Map<String, Object?> toJson() => _$ServiceInfoToJson(this);
}

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

enum Target {
  @JsonValue(0)
  all,
  @JsonValue(1)
  hardware,
  @JsonValue(2)
  software,
}

enum TitleAlignment {
  top,
  bottom,
  middle,
}

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
