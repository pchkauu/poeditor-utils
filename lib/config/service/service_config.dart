import 'package:equatable/equatable.dart';
import 'package:poeditor_utils/config/_barrel.dart';

final class ServiceConfig extends Equatable {
  final POEditorConfig poeditor;

  const ServiceConfig._({
    required this.poeditor,
  });

  factory ServiceConfig.fromJson(Map<String, dynamic> json) {
    const op = 'ServiceConfig.fromJson(): ';

    final poeditorJson = json['poeditor'] as Map<String, dynamic>?;
    if (poeditorJson == null) {
      throw Exception('$op service.poeditor (object) is required');
    }

    final poeditorConfig = POEditorConfig.fromJson(
      poeditorJson,
    );
    return ServiceConfig._(
      poeditor: poeditorConfig,
    );
  }

  @override
  List<Object?> get props => [poeditor];

  @override
  String toString() {
    return 'ServiceConfig\n'
        '\t\tpoeditor: $poeditor';
  }
}
