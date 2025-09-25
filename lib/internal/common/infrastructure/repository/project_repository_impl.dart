import 'package:injectable/injectable.dart';
import 'package:poeditor_utils/internal/common/application/_barrel.dart';
import 'package:poeditor_utils/internal/common/domain/_barrel.dart';
import 'package:poeditor_utils/internal/common/infrastructure/_barrel.dart';
import 'package:poeditor_utils/package/_barrel.dart';

@Singleton(as: ProjectRepository)
final class ProjectRepositoryImpl implements ProjectRepository {
  final HttpClient _httpClient;

  ProjectRepositoryImpl({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<List<Language>> fetchLanguagesV2({
    required Project project,
  }) async {
    return executeMethod(() async {}, (_, __) => UnimplementedError());
    final response = await _httpClient.send.post(
      '/languages/list',
      data: {
        'id': project.id,
      },
    );

    return [
      Language(
        code: 'qwe',
        name: 'qwe',
        translationsCount: 0,
        percentage: 0,
        updatedAt: DateTime.now(),
      ),
    ];
  }
}
