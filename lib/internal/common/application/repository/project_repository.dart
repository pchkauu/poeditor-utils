import 'package:poeditor_utils/internal/common/domain/_barrel.dart';
import 'package:poeditor_utils/package/failure/_barrel.dart';

abstract interface class ProjectRepository {
  Future<Result<Set<Language>>> fetchLanguagesV2({
    required Project project,
  });
}
