import 'package:poeditor_utils/internal/common/infrastructure/_barrel.dart';

/// ```json
/// {
///   "response": {
///     "status": "success",
///     "code": "200",
///     "message": "OK"
///   },
///   "result": {
///     "key": {...}
///   }
/// }
class PoeditorResponseBaseJsonDTO {
  final PoeditorResponseStatusJsonDTO response;
  final Map<String, dynamic> result;

  PoeditorResponseBaseJsonDTO({
    required this.response,
    required this.result,
  });

  factory PoeditorResponseBaseJsonDTO.fromJson(
    Map<String, dynamic> json,
  ) {
    return PoeditorResponseBaseJsonDTO(
      response: PoeditorResponseStatusJsonDTO.fromJson(json['response']! as Map<String, dynamic>),
      result: json['result']! as Map<String, dynamic>,
    );
  }
}
