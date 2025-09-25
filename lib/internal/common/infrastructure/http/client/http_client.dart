import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:poeditor_utils/config/_barrel.dart';
import 'package:poeditor_utils/internal/common/infrastructure/_barrel.dart';

@singleton
class HttpClient {
  final Dio _dio = Dio();
  static const _timeout = Duration(seconds: 60);

  final ApiTokenInterceptor _apiTokenInterceptor;

  HttpClient({
    required ApiTokenInterceptor apiTokenInterceptor,
  }) : _apiTokenInterceptor = apiTokenInterceptor;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _dio.options = BaseOptions(
      baseUrl: ConfigManager.config.service.poeditor.baseURL,
      followRedirects: true,
      persistentConnection: true,
      connectTimeout: _timeout,
      receiveTimeout: _timeout,
      sendTimeout: _timeout,
    );

    _dio.interceptors.add(_apiTokenInterceptor);
  }
}
