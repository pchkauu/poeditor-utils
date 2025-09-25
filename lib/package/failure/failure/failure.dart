import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  final FailureKey key;

  final Object? error;
  final StackTrace? stackTrace;

  const Failure({
    required this.key,
    this.error,
    this.stackTrace,
  });

  @override
  String toString() {
    return '$runtimeType.${key.runtimeType}(${key.message})';
  }

  @override
  List<Object?> get props => [key, error, stackTrace];
}

abstract class FailureKey extends Equatable {
  final String? message;

  const FailureKey({
    this.message,
  });

  @override
  String toString() {
    return message ?? 'No message';
  }

  @override
  List<Object?> get props => [message];
}
