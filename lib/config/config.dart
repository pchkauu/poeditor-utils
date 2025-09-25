import 'package:equatable/equatable.dart';
import 'package:poeditor_utils/config/_barrel.dart';

final class Config extends Equatable {
  final ServiceConfig service;

  const Config._({
    required this.service,
  });

  factory Config.fromJson(Map<String, dynamic> json) {
    final serviceJson = json['service'] as Map<String, dynamic>?;
    if (serviceJson == null) {
      throw Exception('service (object) is required');
    }

    final serviceConfig = ServiceConfig.fromJson(
      serviceJson,
    );

    return Config._(
      service: serviceConfig,
    );
  }

  @override
  List<Object?> get props => [service];

  @override
  String toString() {
    return 'Config\n'
        '\tservice: $service\n';
  }
}
