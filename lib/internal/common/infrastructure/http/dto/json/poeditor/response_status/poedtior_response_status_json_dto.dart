import 'package:freezed_annotation/freezed_annotation.dart';

part 'poedtior_response_status_json_dto.freezed.dart';
part 'poedtior_response_status_json_dto.g.dart';

@freezed
/// ```json
/// {
///   "response": {
///     "status": "success",
///     "code": "200",
///     "message": "OK"
///   },
/// }
/// ```
abstract class PoeditorResponseStatusJsonDTO with _$PoeditorResponseStatusJsonDTO {
  const PoeditorResponseStatusJsonDTO._();

  const factory PoeditorResponseStatusJsonDTO({
    required String status,
    required String code,
    required String message,
  }) = _PoeditorResponseStatusJsonDTO;

  factory PoeditorResponseStatusJsonDTO.fromJson(Map<String, Object?> json) =>
      _$PoeditorResponseStatusJsonDTOFromJson(json);
}
