import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final String code;

  const Language({
    required this.code,
  });

  @override
  List<Object?> get props => [code];
}
