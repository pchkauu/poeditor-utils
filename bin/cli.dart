import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:poeditor_utils/config/_barrel.dart';
import 'package:poeditor_utils/dependencies/_barrel.dart';

Future<void> _onError(Object error, StackTrace stackTrace) async {
  print('Error: $error');
  print('Stack trace: $stackTrace');
}

@pragma('vm:entry-point')
Future<void> main(List<String> arguments) async {
  await runZonedGuarded(
    () async {
      // Get environment from command line
      const environment = String.fromEnvironment('ENVIRONMENT');
      print('Environment: $environment');

      // Parse config from ../config/production.json
      final config = await File('config/$environment.json').readAsString();
      final configMap = jsonDecode(config) as Map<String, dynamic>;

      // Initialize config manager
      ConfigManager.initFromJson(configMap);
      print('Config initialized...\n${ConfigManager.config}');

      // Initialize dependencies
      await configureDependencies();
      print('Dependencies initialized...\n');
    },
    _onError,
  );
}
