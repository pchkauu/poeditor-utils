import 'package:dartx/dartx.dart';
import 'package:poeditor_utils/config/_barrel.dart';

enum Environment {
  production(
    key: 'production',
    config: ConfigProduction(),
  );

  /// One of { production }
  final String key;

  final Config config;

  const Environment({
    required this.key,
    required this.config,
  });

  static Environment? get current {
    return fromConfig(ConfigManager.config);
  }

  static Environment? fromString(String key) {
    return Environment.values.firstOrNullWhere((e) => e.key == key);
  }

  static Environment? fromConfig(Config config) {
    return Environment.values.firstOrNullWhere((e) => e.config == config);
  }
}

abstract class ConfigManager {
  static bool _isInit = false;

  static late final Config _config;

  const ConfigManager._();

  static Config get config {
    if (!_isInit) {
      throw Exception('ConfigManager not initialized');
    }
    return _config;
  }

  static void init(Config config) {
    if (_isInit) {
      throw Exception('ConfigManager already initialized');
    }

    _config = config;
    _isInit = true;

    return;
  }

  static void initFromEnvKey(String envKey) {
    if (_isInit) {
      throw Exception('ConfigManager already initialized');
    }

    final environment = Environment.fromString(envKey);
    if (environment == null) {
      throw Exception('Environment not specified');
    }

    _config = environment.config;
    _isInit = true;

    return;
  }
}
