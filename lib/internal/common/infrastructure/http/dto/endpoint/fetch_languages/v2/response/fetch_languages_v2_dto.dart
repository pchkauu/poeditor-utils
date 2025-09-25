import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poeditor_utils/internal/common/infrastructure/_barrel.dart';

part 'fetch_languages_v2_dto.freezed.dart';
part 'fetch_languages_v2_dto.g.dart';

@Freezed(genericArgumentFactories: true, toJson: false)
abstract class FetchLanguagesV2DTO with _$FetchLanguagesV2DTO {
  const FetchLanguagesV2DTO._();

  const factory FetchLanguagesV2DTO({
    @JsonKey(name: 'languages') required List<LanguageJsonDTO> languages,
  }) = _FetchLanguagesV2DTO;

  factory FetchLanguagesV2DTO.fromJson(Map<String, dynamic> json) => _$FetchLanguagesV2DTOFromJson(json);
}
