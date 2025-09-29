import 'package:dartx/dartx.dart';
import 'package:poeditor_utils/config/_barrel.dart';

enum Environment {
  production(
    key: 'production',
  );

  /// One of { production }
  final String key;

  const Environment({
    required this.key,
  });

  static Environment? fromString(String key) {
    return Environment.values.firstOrNullWhere((e) => e.key == key);
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

  static void initFromJson(Map<String, dynamic> json) {
    if (_isInit) {
      throw Exception('ConfigManager already initialized');
    }

    _config = Config.fromJson(json);
    _isInit = true;
  }
}
