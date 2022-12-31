// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protocol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationDidLaunchEvent _$ApplicationDidLaunchEventFromJson(
        Map<String, dynamic> json) =>
    ApplicationDidLaunchEvent(
      event: json['event'] as String? ?? ApplicationDidLaunchEvent.eventId,
      payload:
          ApplicationPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApplicationDidLaunchEventToJson(
        ApplicationDidLaunchEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'payload': instance.payload,
    };

ApplicationDidTerminateEvent _$ApplicationDidTerminateEventFromJson(
        Map<String, dynamic> json) =>
    ApplicationDidTerminateEvent(
      event: json['event'] as String? ?? ApplicationDidTerminateEvent.eventId,
      payload:
          ApplicationPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApplicationDidTerminateEventToJson(
        ApplicationDidTerminateEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'payload': instance.payload,
    };

ApplicationPayload _$ApplicationPayloadFromJson(Map<String, dynamic> json) =>
    ApplicationPayload(
      application: json['application'] as String,
    );

Map<String, dynamic> _$ApplicationPayloadToJson(ApplicationPayload instance) =>
    <String, dynamic>{
      'application': instance.application,
    };

CommonReceivedPayload _$CommonReceivedPayloadFromJson(
        Map<String, dynamic> json) =>
    CommonReceivedPayload(
      settings: json['settings'] as Map<String, dynamic>,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      state: json['state'] as int?,
    );

Map<String, dynamic> _$CommonReceivedPayloadToJson(
    CommonReceivedPayload instance) {
  final val = <String, dynamic>{
    'settings': instance.settings,
    'coordinates': instance.coordinates,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('state', instance.state);
  return val;
}

ContextPayload _$ContextPayloadFromJson(Map<String, dynamic> json) =>
    ContextPayload(
      settings: json['settings'] as Map<String, dynamic>,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      state: json['state'] as int?,
      isInMultiAction: json['isInMultiAction'] as bool,
    );

Map<String, dynamic> _$ContextPayloadToJson(ContextPayload instance) {
  final val = <String, dynamic>{
    'settings': instance.settings,
    'coordinates': instance.coordinates,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('state', instance.state);
  val['isInMultiAction'] = instance.isInMultiAction;
  return val;
}

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      column: json['column'] as int,
      row: json['row'] as int,
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'column': instance.column,
      'row': instance.row,
    };

DeviceDidConnectEvent _$DeviceDidConnectEventFromJson(
        Map<String, dynamic> json) =>
    DeviceDidConnectEvent(
      event: json['event'] as String? ?? DeviceDidConnectEvent.eventId,
      device: json['device'] as String,
      deviceInfo:
          DeviceInfo.fromJson(json['deviceInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeviceDidConnectEventToJson(
        DeviceDidConnectEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'device': instance.device,
      'deviceInfo': instance.deviceInfo,
    };

DeviceDidDisconnectEvent _$DeviceDidDisconnectEventFromJson(
        Map<String, dynamic> json) =>
    DeviceDidDisconnectEvent(
      event: json['event'] as String? ?? DeviceDidDisconnectEvent.eventId,
      device: json['device'] as String,
    );

Map<String, dynamic> _$DeviceDidDisconnectEventToJson(
        DeviceDidDisconnectEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'device': instance.device,
    };

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) => DeviceInfo(
      name: json['name'] as String,
      type: json['type'] as int,
      size: DeviceSize.fromJson(json['size'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeviceInfoToJson(DeviceInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'size': instance.size,
    };

DeviceSize _$DeviceSizeFromJson(Map<String, dynamic> json) => DeviceSize(
      columns: json['columns'] as int,
      rows: json['rows'] as int,
    );

Map<String, dynamic> _$DeviceSizeToJson(DeviceSize instance) =>
    <String, dynamic>{
      'columns': instance.columns,
      'rows': instance.rows,
    };

DialPressEvent _$DialPressEventFromJson(Map<String, dynamic> json) =>
    DialPressEvent(
      event: json['event'] as String? ?? DialPressEvent.eventId,
      action: json['action'] as String,
      context: json['context'] as String,
      device: json['device'] as String,
      payload:
          DialPressPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DialPressEventToJson(DialPressEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'action': instance.action,
      'context': instance.context,
      'device': instance.device,
      'payload': instance.payload,
    };

DialPressPayload _$DialPressPayloadFromJson(Map<String, dynamic> json) =>
    DialPressPayload(
      settings: json['settings'] as Map<String, dynamic>,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      pressed: json['pressed'] as bool,
    );

Map<String, dynamic> _$DialPressPayloadToJson(DialPressPayload instance) =>
    <String, dynamic>{
      'settings': instance.settings,
      'coordinates': instance.coordinates,
      'pressed': instance.pressed,
    };

DialRotateEvent _$DialRotateEventFromJson(Map<String, dynamic> json) =>
    DialRotateEvent(
      event: json['event'] as String? ?? DialRotateEvent.eventId,
      action: json['action'] as String,
      context: json['context'] as String,
      device: json['device'] as String,
      payload:
          DialRotatePayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DialRotateEventToJson(DialRotateEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'action': instance.action,
      'context': instance.context,
      'device': instance.device,
      'payload': instance.payload,
    };

DialRotatePayload _$DialRotatePayloadFromJson(Map<String, dynamic> json) =>
    DialRotatePayload(
      settings: json['settings'] as Map<String, dynamic>,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      ticks: json['ticks'] as int,
      pressed: json['pressed'] as bool,
    );

Map<String, dynamic> _$DialRotatePayloadToJson(DialRotatePayload instance) =>
    <String, dynamic>{
      'settings': instance.settings,
      'coordinates': instance.coordinates,
      'ticks': instance.ticks,
      'pressed': instance.pressed,
    };

DidReceiveGlobalSettingsEvent _$DidReceiveGlobalSettingsEventFromJson(
        Map<String, dynamic> json) =>
    DidReceiveGlobalSettingsEvent(
      event: json['event'] as String? ?? DidReceiveGlobalSettingsEvent.eventId,
      payload: DidReceiveGlobalSettingsPayload.fromJson(
          json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DidReceiveGlobalSettingsEventToJson(
        DidReceiveGlobalSettingsEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'payload': instance.payload,
    };

DidReceiveGlobalSettingsPayload _$DidReceiveGlobalSettingsPayloadFromJson(
        Map<String, dynamic> json) =>
    DidReceiveGlobalSettingsPayload(
      settings: json['settings'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$DidReceiveGlobalSettingsPayloadToJson(
        DidReceiveGlobalSettingsPayload instance) =>
    <String, dynamic>{
      'settings': instance.settings,
    };

DidReceiveSettingsEvent _$DidReceiveSettingsEventFromJson(
        Map<String, dynamic> json) =>
    DidReceiveSettingsEvent(
      event: json['event'] as String? ?? DidReceiveGlobalSettingsEvent.eventId,
      action: json['action'] as String,
      context: json['context'] as String,
      device: json['device'] as String,
      payload: ContextPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DidReceiveSettingsEventToJson(
        DidReceiveSettingsEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'action': instance.action,
      'context': instance.context,
      'device': instance.device,
      'payload': instance.payload,
    };

GetGlobalSettingsEvent _$GetGlobalSettingsEventFromJson(
        Map<String, dynamic> json) =>
    GetGlobalSettingsEvent(
      event: json['event'] as String? ?? GetGlobalSettingsEvent.eventId,
      context: json['context'] as String,
    );

Map<String, dynamic> _$GetGlobalSettingsEventToJson(
        GetGlobalSettingsEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
    };

GetSettingsEvent _$GetSettingsEventFromJson(Map<String, dynamic> json) =>
    GetSettingsEvent(
      event: json['event'] as String? ?? GetSettingsEvent.eventId,
      context: json['context'] as String,
    );

Map<String, dynamic> _$GetSettingsEventToJson(GetSettingsEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
    };

KeyDownEvent _$KeyDownEventFromJson(Map<String, dynamic> json) => KeyDownEvent(
      event: json['event'] as String? ?? KeyDownEvent.eventId,
      action: json['action'] as String,
      context: json['context'] as String,
      device: json['device'] as String,
      payload: KeyPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KeyDownEventToJson(KeyDownEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'action': instance.action,
      'context': instance.context,
      'device': instance.device,
      'payload': instance.payload,
    };

KeyPayload _$KeyPayloadFromJson(Map<String, dynamic> json) => KeyPayload(
      settings: json['settings'] as Map<String, dynamic>,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      state: json['state'] as int?,
      userDesiredState: json['userDesiredState'] as int?,
      isInMultiAction: json['isInMultiAction'] as bool,
    );

Map<String, dynamic> _$KeyPayloadToJson(KeyPayload instance) {
  final val = <String, dynamic>{
    'settings': instance.settings,
    'coordinates': instance.coordinates,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('state', instance.state);
  val['isInMultiAction'] = instance.isInMultiAction;
  writeNotNull('userDesiredState', instance.userDesiredState);
  return val;
}

KeyUpEvent _$KeyUpEventFromJson(Map<String, dynamic> json) => KeyUpEvent(
      event: json['event'] as String? ?? KeyUpEvent.eventId,
      action: json['action'] as String,
      context: json['context'] as String,
      device: json['device'] as String,
      payload: KeyPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KeyUpEventToJson(KeyUpEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'action': instance.action,
      'context': instance.context,
      'device': instance.device,
      'payload': instance.payload,
    };

LogMessageEvent _$LogMessageEventFromJson(Map<String, dynamic> json) =>
    LogMessageEvent(
      event: json['event'] as String? ?? LogMessageEvent.eventId,
      context: json['context'] as String,
      payload:
          LogMessagePayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LogMessageEventToJson(LogMessageEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
      'payload': instance.payload,
    };

LogMessagePayload _$LogMessagePayloadFromJson(Map<String, dynamic> json) =>
    LogMessagePayload(
      message: json['message'] as String,
    );

Map<String, dynamic> _$LogMessagePayloadToJson(LogMessagePayload instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

OpenUrlEvent _$OpenUrlEventFromJson(Map<String, dynamic> json) => OpenUrlEvent(
      event: json['event'] as String? ?? OpenUrlEvent.eventId,
      context: json['context'] as String,
      payload: OpenUrlPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpenUrlEventToJson(OpenUrlEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
      'payload': instance.payload,
    };

OpenUrlPayload _$OpenUrlPayloadFromJson(Map<String, dynamic> json) =>
    OpenUrlPayload(
      url: json['url'] as String,
    );

Map<String, dynamic> _$OpenUrlPayloadToJson(OpenUrlPayload instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

PropertyInspectorDidAppearEvent _$PropertyInspectorDidAppearEventFromJson(
        Map<String, dynamic> json) =>
    PropertyInspectorDidAppearEvent(
      event:
          json['event'] as String? ?? PropertyInspectorDidAppearEvent.eventId,
      action: json['action'] as String,
      context: json['context'] as String,
      device: json['device'] as String,
    );

Map<String, dynamic> _$PropertyInspectorDidAppearEventToJson(
        PropertyInspectorDidAppearEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'action': instance.action,
      'context': instance.context,
      'device': instance.device,
    };

PropertyInspectorDidDisappearEvent _$PropertyInspectorDidDisappearEventFromJson(
        Map<String, dynamic> json) =>
    PropertyInspectorDidDisappearEvent(
      event: json['event'] as String? ??
          PropertyInspectorDidDisappearEvent.eventId,
      action: json['action'] as String,
      context: json['context'] as String,
      device: json['device'] as String,
    );

Map<String, dynamic> _$PropertyInspectorDidDisappearEventToJson(
        PropertyInspectorDidDisappearEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'action': instance.action,
      'context': instance.context,
      'device': instance.device,
    };

SendToPluginEvent _$SendToPluginEventFromJson(Map<String, dynamic> json) =>
    SendToPluginEvent(
      event: json['event'] as String? ?? SendToPluginEvent.eventId,
      action: json['action'] as String,
      context: json['context'] as String,
      device: json['device'] as String,
      payload: json['payload'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$SendToPluginEventToJson(SendToPluginEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'action': instance.action,
      'context': instance.context,
      'device': instance.device,
      'payload': instance.payload,
    };

SendToPropertyInspectorEvent _$SendToPropertyInspectorEventFromJson(
        Map<String, dynamic> json) =>
    SendToPropertyInspectorEvent(
      event: json['event'] as String? ?? SendToPropertyInspectorEvent.eventId,
      action: json['action'] as String,
      context: json['context'] as String,
      device: json['device'] as String,
      payload: json['payload'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$SendToPropertyInspectorEventToJson(
        SendToPropertyInspectorEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'action': instance.action,
      'context': instance.context,
      'device': instance.device,
      'payload': instance.payload,
    };

ServiceInfo _$ServiceInfoFromJson(Map<String, dynamic> json) => ServiceInfo();

Map<String, dynamic> _$ServiceInfoToJson(ServiceInfo instance) =>
    <String, dynamic>{};

SetFeedbackEvent _$SetFeedbackEventFromJson(Map<String, dynamic> json) =>
    SetFeedbackEvent(
      event: json['event'] as String? ?? SetFeedbackEvent.eventId,
      context: json['context'] as String,
      payload: Map<String, String>.from(json['payload'] as Map),
    );

Map<String, dynamic> _$SetFeedbackEventToJson(SetFeedbackEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
      'payload': instance.payload,
    };

SetFeedbackLayoutEvent _$SetFeedbackLayoutEventFromJson(
        Map<String, dynamic> json) =>
    SetFeedbackLayoutEvent(
      event: json['event'] as String? ?? SetFeedbackLayoutEvent.eventId,
      context: json['context'] as String,
      payload: SetFeedbackLayoutPayload.fromJson(
          json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SetFeedbackLayoutEventToJson(
        SetFeedbackLayoutEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
      'payload': instance.payload,
    };

SetFeedbackLayoutPayload _$SetFeedbackLayoutPayloadFromJson(
        Map<String, dynamic> json) =>
    SetFeedbackLayoutPayload(
      layout: json['layout'] as String,
    );

Map<String, dynamic> _$SetFeedbackLayoutPayloadToJson(
        SetFeedbackLayoutPayload instance) =>
    <String, dynamic>{
      'layout': instance.layout,
    };

SetGlobalSettingsEvent _$SetGlobalSettingsEventFromJson(
        Map<String, dynamic> json) =>
    SetGlobalSettingsEvent(
      event: json['event'] as String? ?? SetGlobalSettingsEvent.eventId,
      context: json['context'] as String,
      payload: json['payload'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$SetGlobalSettingsEventToJson(
        SetGlobalSettingsEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
      'payload': instance.payload,
    };

SetImageEvent _$SetImageEventFromJson(Map<String, dynamic> json) =>
    SetImageEvent(
      event: json['event'] as String? ?? SetImageEvent.eventId,
      context: json['context'] as String,
      payload:
          SetImagePayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SetImageEventToJson(SetImageEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
      'payload': instance.payload,
    };

SetImagePayload _$SetImagePayloadFromJson(Map<String, dynamic> json) =>
    SetImagePayload(
      image: json['image'] as String,
      target: $enumDecodeNullable(_$TargetEnumMap, json['target']),
      state: json['state'] as int?,
    );

Map<String, dynamic> _$SetImagePayloadToJson(SetImagePayload instance) {
  final val = <String, dynamic>{
    'image': instance.image,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('target', _$TargetEnumMap[instance.target]);
  writeNotNull('state', instance.state);
  return val;
}

const _$TargetEnumMap = {
  Target.all: 0,
  Target.hardware: 1,
  Target.software: 2,
};

SetSettingsEvent _$SetSettingsEventFromJson(Map<String, dynamic> json) =>
    SetSettingsEvent(
      event: json['event'] as String? ?? SetSettingsEvent.eventId,
      context: json['context'] as String,
      payload: json['payload'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$SetSettingsEventToJson(SetSettingsEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
      'payload': instance.payload,
    };

SetStateEvent _$SetStateEventFromJson(Map<String, dynamic> json) =>
    SetStateEvent(
      event: json['event'] as String? ?? SetStateEvent.eventId,
      context: json['context'] as String,
      payload:
          SetStatePayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SetStateEventToJson(SetStateEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
      'payload': instance.payload,
    };

SetStatePayload _$SetStatePayloadFromJson(Map<String, dynamic> json) =>
    SetStatePayload(
      state: json['state'] as int,
    );

Map<String, dynamic> _$SetStatePayloadToJson(SetStatePayload instance) =>
    <String, dynamic>{
      'state': instance.state,
    };

SetTitleEvent _$SetTitleEventFromJson(Map<String, dynamic> json) =>
    SetTitleEvent(
      event: json['event'] as String? ?? SetTitleEvent.eventId,
      context: json['context'] as String,
      payload:
          SetTitlePayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SetTitleEventToJson(SetTitleEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
      'payload': instance.payload,
    };

SetTitlePayload _$SetTitlePayloadFromJson(Map<String, dynamic> json) =>
    SetTitlePayload(
      title: json['title'] as String,
      target: $enumDecodeNullable(_$TargetEnumMap, json['target']),
      state: json['state'] as int?,
    );

Map<String, dynamic> _$SetTitlePayloadToJson(SetTitlePayload instance) {
  final val = <String, dynamic>{
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('target', _$TargetEnumMap[instance.target]);
  writeNotNull('state', instance.state);
  return val;
}

ShowAlertEvent _$ShowAlertEventFromJson(Map<String, dynamic> json) =>
    ShowAlertEvent(
      event: json['event'] as String? ?? ShowAlertEvent.eventId,
      context: json['context'] as String,
    );

Map<String, dynamic> _$ShowAlertEventToJson(ShowAlertEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
    };

ShowOkEvent _$ShowOkEventFromJson(Map<String, dynamic> json) => ShowOkEvent(
      event: json['event'] as String? ?? ShowOkEvent.eventId,
      context: json['context'] as String,
    );

Map<String, dynamic> _$ShowOkEventToJson(ShowOkEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
    };

SwitchToProfileEvent _$SwitchToProfileEventFromJson(
        Map<String, dynamic> json) =>
    SwitchToProfileEvent(
      event: json['event'] as String? ?? SwitchToProfileEvent.eventId,
      context: json['context'] as String,
      device: json['device'] as String,
      payload: SwitchToProfilePayload.fromJson(
          json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SwitchToProfileEventToJson(
        SwitchToProfileEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'context': instance.context,
      'device': instance.device,
      'payload': instance.payload,
    };

SwitchToProfilePayload _$SwitchToProfilePayloadFromJson(
        Map<String, dynamic> json) =>
    SwitchToProfilePayload(
      profile: json['profile'] as String,
    );

Map<String, dynamic> _$SwitchToProfilePayloadToJson(
        SwitchToProfilePayload instance) =>
    <String, dynamic>{
      'profile': instance.profile,
    };

SystemDidWakeUpEvent _$SystemDidWakeUpEventFromJson(
        Map<String, dynamic> json) =>
    SystemDidWakeUpEvent(
      event: json['event'] as String? ?? SystemDidWakeUpEvent.eventId,
    );

Map<String, dynamic> _$SystemDidWakeUpEventToJson(
        SystemDidWakeUpEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
    };

TitleParameters _$TitleParametersFromJson(Map<String, dynamic> json) =>
    TitleParameters(
      fontFamily: json['fontFamily'] as String,
      fontSize: json['fontSize'] as int,
      fontStyle: json['fontStyle'] as String,
      fontUnderline: json['fontUnderline'] as bool,
      showTitle: json['showTitle'] as bool,
      titleAlignment:
          $enumDecode(_$TitleAlignmentEnumMap, json['titleAlignment']),
      titleColor: json['titleColor'] as String,
    );

Map<String, dynamic> _$TitleParametersToJson(TitleParameters instance) =>
    <String, dynamic>{
      'fontFamily': instance.fontFamily,
      'fontSize': instance.fontSize,
      'fontStyle': instance.fontStyle,
      'fontUnderline': instance.fontUnderline,
      'showTitle': instance.showTitle,
      'titleAlignment': _$TitleAlignmentEnumMap[instance.titleAlignment]!,
      'titleColor': instance.titleColor,
    };

const _$TitleAlignmentEnumMap = {
  TitleAlignment.top: 'top',
  TitleAlignment.bottom: 'bottom',
  TitleAlignment.middle: 'middle',
};

TitleParametersDidChangeEvent _$TitleParametersDidChangeEventFromJson(
        Map<String, dynamic> json) =>
    TitleParametersDidChangeEvent(
      event: json['event'] as String? ?? TitleParametersDidChangeEvent.eventId,
      action: json['action'] as String,
      context: json['context'] as String,
      device: json['device'] as String,
      payload: TitleParametersDidChangePayload.fromJson(
          json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TitleParametersDidChangeEventToJson(
        TitleParametersDidChangeEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'action': instance.action,
      'context': instance.context,
      'device': instance.device,
      'payload': instance.payload,
    };

TitleParametersDidChangePayload _$TitleParametersDidChangePayloadFromJson(
        Map<String, dynamic> json) =>
    TitleParametersDidChangePayload(
      settings: json['settings'] as Map<String, dynamic>,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      state: json['state'] as int?,
      title: json['title'] as String,
      titleParameters: TitleParameters.fromJson(
          json['titleParameters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TitleParametersDidChangePayloadToJson(
    TitleParametersDidChangePayload instance) {
  final val = <String, dynamic>{
    'settings': instance.settings,
    'coordinates': instance.coordinates,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('state', instance.state);
  val['title'] = instance.title;
  val['titleParameters'] = instance.titleParameters;
  return val;
}

TouchTapEvent _$TouchTapEventFromJson(Map<String, dynamic> json) =>
    TouchTapEvent(
      event: json['event'] as String? ?? TouchTapEvent.eventId,
      action: json['action'] as String,
      context: json['context'] as String,
      device: json['device'] as String,
      payload:
          TouchTapPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TouchTapEventToJson(TouchTapEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'action': instance.action,
      'context': instance.context,
      'device': instance.device,
      'payload': instance.payload,
    };

TouchTapPayload _$TouchTapPayloadFromJson(Map<String, dynamic> json) =>
    TouchTapPayload(
      settings: json['settings'] as Map<String, dynamic>,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      tapPos: (json['tapPos'] as List<dynamic>).map((e) => e as int).toList(),
      hold: json['hold'] as bool,
    );

Map<String, dynamic> _$TouchTapPayloadToJson(TouchTapPayload instance) =>
    <String, dynamic>{
      'settings': instance.settings,
      'coordinates': instance.coordinates,
      'tapPos': instance.tapPos,
      'hold': instance.hold,
    };

WillAppearEvent _$WillAppearEventFromJson(Map<String, dynamic> json) =>
    WillAppearEvent(
      event: json['event'] as String? ?? WillAppearEvent.eventId,
      action: json['action'] as String,
      context: json['context'] as String,
      device: json['device'] as String,
      payload: ContextPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WillAppearEventToJson(WillAppearEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'action': instance.action,
      'context': instance.context,
      'device': instance.device,
      'payload': instance.payload,
    };

WillDisappearEvent _$WillDisappearEventFromJson(Map<String, dynamic> json) =>
    WillDisappearEvent(
      event: json['event'] as String? ?? WillDisappearEvent.eventId,
      action: json['action'] as String,
      context: json['context'] as String,
      device: json['device'] as String,
      payload: ContextPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WillDisappearEventToJson(WillDisappearEvent instance) =>
    <String, dynamic>{
      'event': instance.event,
      'action': instance.action,
      'context': instance.context,
      'device': instance.device,
      'payload': instance.payload,
    };
