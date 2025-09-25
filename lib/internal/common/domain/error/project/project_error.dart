import 'package:poeditor_utils/package/failure/_barrel.dart';

final class ProjectError extends Failure {
  const ProjectError({
    required super.key,
    super.error,
    super.stackTrace,
  });
}

sealed class ProjectFailureKey extends FailureKey {
  const ProjectFailureKey({
    super.message,
  });
}

class ProjectNotFoundError extends ProjectFailureKey {
  const ProjectNotFoundError({
    super.message = 'Project not found',
  });
}

class ProjectInternalError extends ProjectFailureKey {
  const ProjectInternalError({
    super.message = 'Project internal error',
  });
}

class ProjectUndefinedError extends ProjectFailureKey {
  const ProjectUndefinedError({
    super.message = 'Project internal error',
  });
}
