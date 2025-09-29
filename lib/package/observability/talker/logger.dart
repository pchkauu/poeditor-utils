import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

abstract class Logger {
  static Talker? _talker;

  const Logger._();

  static Talker get talker {
    if (_talker == null) {
      throw Exception('Talker not initialized');
    }
    return _talker!;
  }

  static bool _isInit = _talker != null;

  static bool get isInit => _isInit;

  static void init() {
    if (_isInit) {
      throw Exception('Talker already initialized');
    }
    _isInit = true;

    _talker = Talker(
      logger: TalkerLogger(),
      settings: TalkerSettings(),
    );
  }

  static TalkerDioLogger get dioInterceptor {
    if (_talker == null) {
      throw Exception('Talker not initialized');
    }
    return TalkerDioLogger(
      talker: Logger._talker,
      settings: const TalkerDioLoggerSettings(printRequestHeaders: true, printResponseHeaders: true),
    );
  }

  static void verbose(
    String msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    if (_talker == null) {
      throw Exception('Talker not initialized');
    }
    _talker!.verbose(msg, exception, stackTrace);
  }

  static void debug(
    String msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    if (_talker == null) {
      throw Exception('Talker not initialized');
    }
    _talker!.debug(msg, exception, stackTrace);
  }

  static void info(
    String msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    if (_talker == null) {
      throw Exception('Talker not initialized');
    }
    _talker!.info(msg, exception, stackTrace);
  }

  static void warning(
    String msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    if (_talker == null) {
      throw Exception('Talker not initialized');
    }
    _talker!.warning(msg, exception, stackTrace);
  }

  static void error(
    String msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    if (_talker == null) {
      throw Exception('Talker not initialized');
    }
    _talker!.error(msg, exception, stackTrace);
  }

  static void critical(
    String msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]) {
    if (_talker == null) {
      throw Exception('Talker not initialized');
    }
    _talker!.critical(msg, exception, stackTrace);
  }

  static void unhandled(Object error, StackTrace stackTrace) {
    if (_talker == null) {
      throw Exception('Talker not initialized');
    }
    _talker!.critical(error.toString(), error, stackTrace);
  }
}
