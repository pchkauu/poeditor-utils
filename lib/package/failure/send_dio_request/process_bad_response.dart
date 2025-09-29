import 'package:dio/dio.dart';

Future<Never> processBadResponse({
  required DioException dioException,
  StackTrace? stackTrace,
}) async {
  throw dioException;
}
