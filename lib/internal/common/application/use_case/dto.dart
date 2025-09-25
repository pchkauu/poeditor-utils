import 'package:equatable/equatable.dart';
import 'package:poeditor_utils/internal/common/domain/_barrel.dart';

class DefineAllAvailableLanguagesParams extends Equatable {
  final List<Project> projects;

  const DefineAllAvailableLanguagesParams({
    required this.projects,
  });

  @override
  List<Object?> get props => [projects];
}

class DefineAllAvailableLanguagesResult extends Equatable {
  /// Проекты с информацией о доступных языках
  final List<Project> projects;

  const DefineAllAvailableLanguagesResult({
    required this.projects,
  });

  @override
  List<Object?> get props => [projects];
}
