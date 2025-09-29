import 'package:either_dart/either.dart';
import 'package:poeditor_utils/package/failure/_barrel.dart';
import 'package:poeditor_utils/package/observability/_barrel.dart';

Future<Result<T>> executeMethod<T>(
  Future<T> Function() methodLogic,
  Failure Function(Object, StackTrace) failureFactory,
) async {
  try {
    return Right(
      await methodLogic(),
    );
  } on Failure catch (failure, stackTrace) {
    await Observability.captureError(
      failure.toString(),
      failure,
      stackTrace,
    );

    return Left(failure);
  } on Object catch (error, stackTrace) {
    await Observability.captureCritical(
      error.toString(),
      error,
      stackTrace,
    );

    return Left(failureFactory(error, stackTrace));
  }
}
