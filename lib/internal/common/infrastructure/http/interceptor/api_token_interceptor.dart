import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:poeditor_utils/config/_barrel.dart';

@singleton
class ApiTokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    (options.data as Map<String, dynamic>)['api_token'] = ConfigManager.config.service.poeditor.apiToken;

    return handler.next(options);
  }
}
