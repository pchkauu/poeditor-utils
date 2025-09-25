import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:poeditor_utils/poeditor_utils.dart';

@pragma('vm:entry-point')
Future<void> main(List<String> arguments) async {
  Logger.init();
  Logger.info('Logger initialized...\n');

  await runZonedGuarded(
    () async {
      // Get environment from command line
      const environment = String.fromEnvironment('ENVIRONMENT');
      Logger.info('Environment: $environment');

      // Parse config from ../config/production.json
      final config = await File('config/$environment.json').readAsString();
      final configMap = jsonDecode(config) as Map<String, dynamic>;

      // Initialize config manager
      ConfigManager.initFromJson(configMap);
      Logger.info('Config initialized...\n${ConfigManager.config}');

      // Initialize dependencies
      await configureDependencies();
      Logger.info('Dependencies initialized...\n');

      final projectRepository = getIt<ProjectRepository>();

      for (final projectID in ConfigManager.config.service.poeditor.projectIDs) {
        final languages = await projectRepository.fetchLanguagesV2(project: Project.fromID(id: projectID));
        Logger.info('Languages: $languages');
      }
    },
    Logger.unhandled,
  );
}
