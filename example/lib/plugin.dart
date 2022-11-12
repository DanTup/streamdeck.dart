import 'package:streamdeck/streamdeck.dart';
import 'package:streamdeck_example_plugin/clock.dart';
import 'package:streamdeck_example_plugin/counter.dart';
import 'package:streamdeck_example_plugin/hold.dart';

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
  }
}
