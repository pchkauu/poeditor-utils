import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poeditor_utils/internal/common/domain/_barrel.dart';
import 'package:poeditor_utils/package/observability/_barrel.dart';

part 'language_json_dto.freezed.dart';
part 'language_json_dto.g.dart';

@freezed
/// ```json
/// {
///   "name": "French",
///   "code": "fr",
///   "translations": 1345,
///   "percentage": 99.48,
///   "updated": "2025-09-22T10:26:41+0000"
/// }
/// ```
abstract class LanguageJsonDTO with _$LanguageJsonDTO {
  const LanguageJsonDTO._();

  const factory LanguageJsonDTO({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'translations') required int translations,
    @JsonKey(name: 'percentage') required double percentage,
    @JsonKey(name: 'updated') required String updated,
  }) = _LanguageJsonDTO;

  factory LanguageJsonDTO.fromJson(Map<String, Object?> json) => _$LanguageJsonDTOFromJson(json);

  Language toEntity() {
    const op = 'LanguageJsonDTO.toEntity(): ';

    String normalizeTz(String input) {
      final match = RegExp(r'^(.*[T ]\d{2}:\d{2}:\d{2})([+-]\d{2})(\d{2})$').firstMatch(input);
      if (match != null) {
        return '${match.group(1)}${match.group(2)}:${match.group(3)}';
      }
      return input;
    }

    DateTime parseUpdated(String input) {
      final trimmed = input.trim();
      if (trimmed.isEmpty) {
        return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
      }
      final normalized = normalizeTz(trimmed);
      try {
        return DateTime.parse(normalized);
      } on Object catch (error, stackTrace) {
        Observability.captureWarning('$op Error parsing updated date', error, stackTrace);
        return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
      }
    }

    return Language(
      name: name,
      code: code,
      translationsCount: translations,
      percentage: percentage,
      updatedAt: parseUpdated(updated),
    );
  }
}
