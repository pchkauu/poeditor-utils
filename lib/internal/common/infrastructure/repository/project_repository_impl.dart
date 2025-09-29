import 'package:injectable/injectable.dart';
import 'package:poeditor_utils/internal/common/application/_barrel.dart';
import 'package:poeditor_utils/internal/common/domain/_barrel.dart';
import 'package:poeditor_utils/internal/common/infrastructure/_barrel.dart';
import 'package:poeditor_utils/package/failure/_barrel.dart';

@Singleton(as: ProjectRepository)
final class ProjectRepositoryImpl implements ProjectRepository {
  final HttpClient _httpClient;

  ProjectRepositoryImpl({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<Result<Set<Language>>> fetchLanguagesV2({
    required Project project,
  }) async {
    return executeMethod<Set<Language>>(
      () async {
        final response = await sendDioRequest<PoeditorResponseBaseJsonDTO>(
          () async {
            final response = await _httpClient.send.post(
              '/languages/list',
              data: {'id': project.id},
            );

            return PoeditorResponseBaseJsonDTO.fromJson(
              response.data as Map<String, dynamic>,
            );
          },
          (error, stackTrace) {
            final responseBase = PoeditorResponseBaseJsonDTO.fromJson(
              error.response?.data as Map<String, dynamic>,
            );

            return ProjectError(
              key: switch (responseBase.response.status) {
                '404' => const ProjectNotFoundError(),
                '500' => const ProjectInternalError(),
                _ => const ProjectUndefinedError(),
              },
            );
          },
        );

        final languagesJson = FetchLanguagesV2DTO.fromJson(
          response.result,
        );

        return languagesJson.languages.map((dto) => dto.toEntity()).toSet();
      },
      (error, stackTrace) => const ProjectError(
        key: ProjectUndefinedError(),
      ),
    );
  }
}
