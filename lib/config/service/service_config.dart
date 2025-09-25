import 'package:poeditor_utils/config/_barrel.dart';

sealed class ServiceConfig {
  POEditorConfig get poeditor;

  const ServiceConfig();
}

final class ServiceConfigProduction extends ServiceConfig {
  @override
  POEditorConfig get poeditor => const POEditorConfigProduction();

  const ServiceConfigProduction();
}
