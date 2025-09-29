import 'package:poeditor_utils/package/observability/_barrel.dart';

abstract class Observability {
  const Observability._();

  static Future<void> captureWarning(
    String msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]) async {
    Logger.warning(msg, exception, stackTrace);

    return;
  }

  static Future<void> captureError(
    String msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]) async {
    Logger.error(msg, exception, stackTrace);

    return;
  }

  static Future<void> captureCritical(
    String msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]) async {
    Logger.critical(msg, exception, stackTrace);

    return;
  }

  static Future<void> handleForeground(
    Object error,
    StackTrace? stackTrace,
  ) async {
    Logger.critical(
      '🚨🚨🚨 [FOREGROUND] Unhandled Error Catched In Global Zone 🚨🚨🚨',
      error,
      stackTrace,
    );

    return;
  }

  static Future<void> handleBackground(
    Object error,
    StackTrace? stackTrace,
  ) async {
    Logger.critical(
      '⚠️⚠️⚠️ [BACKGROUND] Unhandled Error Catched In Global Zone ⚠️⚠️⚠️',
      error,
      stackTrace,
    );

    return;
  }
}
