import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:poeditor_utils/internal/common/application/_barrel.dart';
import 'package:poeditor_utils/internal/common/domain/_barrel.dart';
import 'package:poeditor_utils/package/failure/_barrel.dart';

@Singleton(as: CommonUseCase)
class CommonUseCaseImpl implements CommonUseCase {
  final ProjectRepository _projectRepository;

  CommonUseCaseImpl({
    required ProjectRepository projectRepository,
  }) : _projectRepository = projectRepository;

  @override
  Future<Result<DefineAllAvailableLanguagesResult>> defineAllAvailableLanguages({
    required DefineAllAvailableLanguagesParams params,
  }) async {
    final projectsWithLanguages = <Project>[];

    for (final project in projectsWithLanguages) {
      final languages = await _projectRepository.fetchLanguagesV2(
        project: project,
      );

      if (languages.isLeft) {
        return Left(languages.left);
      }

      projectsWithLanguages.add(
        project.addLanguages(languages: languages.right),
      );
    }

    final result = DefineAllAvailableLanguagesResult(
      projects: projectsWithLanguages,
    );

    return Right(result);
  }
}
