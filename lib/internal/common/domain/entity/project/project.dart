import 'package:equatable/equatable.dart';
import 'package:poeditor_utils/internal/common/domain/_barrel.dart';

typedef ProjectID = String;

class Project extends Equatable {
  final ProjectID id;
  final Set<Language> languages;

  const Project({
    required this.id,
    required this.languages,
  });

  factory Project.fromID({required ProjectID id}) {
    return Project(
      id: id,
      languages: const {},
    );
  }

  @override
  List<Object?> get props => [id, languages];
}
