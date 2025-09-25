import 'package:poeditor_utils/config/_barrel.dart';

sealed class Config {
  ServiceConfig get service;

  const Config();
}

final class ConfigProduction extends Config {
  @override
  ServiceConfig get service => const ServiceConfigProduction();

  const ConfigProduction();
}
