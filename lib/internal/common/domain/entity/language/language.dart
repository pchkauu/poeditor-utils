import 'package:equatable/equatable.dart';

/// ```json
/// {
///   "name": "French",
///   "code": "fr",
///   "translations": 1345,
///   "percentage": 99.48,
///   "updated": "2025-09-22T10:26:41+0000"
/// }
/// ```
class Language extends Equatable {
  final String name;
  final String code;
  final int translationsCount;
  final double percentage;
  final DateTime updatedAt;

  const Language({
    required this.name,
    required this.code,
    required this.translationsCount,
    required this.percentage,
    required this.updatedAt,
  });

  factory Language.fromCode({required String code}) {
    return Language(
      name: '',
      code: code,
      translationsCount: 0,
      percentage: 0,
      updatedAt: DateTime.now(),
    );
  }

  @override
  String toString() {
    return 'Language\n'
        '\tname: $name,\n'
        '\tcode: $code,\n'
        '\ttranslationsCount: $translationsCount,\n'
        '\tpercentage: $percentage,\n'
        '\tupdatedAt: $updatedAt\n';
  }

  @override
  List<Object?> get props => [name, code, translationsCount, percentage, updatedAt];
}
