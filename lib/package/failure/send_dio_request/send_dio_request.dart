import 'package:dio/dio.dart';
import 'package:poeditor_utils/package/failure/_barrel.dart';

Future<T> sendDioRequest<T>(
  Future<T> Function() requestLogic,
  Failure Function(DioException, StackTrace) failureFactory,
) async {
  try {
    return await requestLogic();
  } on DioException catch (dioException, stackTrace) {
    throw failureFactory(dioException, stackTrace);
  } on Object {
    rethrow;
  }
}
