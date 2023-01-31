import 'package:streamdeck/streamdeck.dart';
import 'package:streamdeck_example_plugin/clock.dart';
import 'package:streamdeck_example_plugin/counter.dart';
import 'package:streamdeck_example_plugin/hold.dart';
import 'package:streamdeck_example_plugin/indicator.dart';
import 'package:streamdeck_example_plugin/image.dart';

class Plugin extends StreamDeckPlugin {
  Plugin({
    required super.socket,
    required super.pluginUuid,
    required super.registerEvent,
    required super.info,
    super.logSink,
  }) {
    registerAction(CounterAction.actionUuid, CounterAction.new);
    registerAction(ClockAction.actionUuid, ClockAction.new);
    registerAction(HoldAction.actionUuid, HoldAction.new);
    registerAction(IndicatorAction.actionUuid, IndicatorAction.new);
    registerAction(ImageAction.actionUuid, ImageAction.new);
  }
}
