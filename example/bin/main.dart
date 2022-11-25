import 'dart:async';
import 'dart:io';

import 'package:streamdeck/streamdeck.dart';
import 'package:path/path.dart' as path;
import 'package:streamdeck_example_plugin/plugin.dart';

final logFilePath = path.join(
  path.dirname(Platform.script.toFilePath()),
  'log.txt',
);

late File logFile;

Future<void> main(List<String> arguments) async {
  final log = File(logFilePath).openWrite(mode: FileMode.append);
  log.writeln('Starting plugin: $arguments');

  late final Plugin plugin;
  await runZonedGuarded(
    () async {
      plugin = await StreamDeckPlugin.connect(
        Plugin.new,
        arguments,
        logSink: log,
      );
    },
    (error, stack) => log.writeln('ERROR: $error $stack'),
  );

  await plugin.done;
  log.writeln('Done!');
  await log.flush();
}
