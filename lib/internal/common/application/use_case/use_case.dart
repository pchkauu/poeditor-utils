import 'package:poeditor_utils/internal/common/application/_barrel.dart';
import 'package:poeditor_utils/package/failure/_barrel.dart';

abstract interface class CommonUseCase {
  Future<Result<DefineAllAvailableLanguagesResult>> defineAllAvailableLanguages({
    required DefineAllAvailableLanguagesParams params,
  });
}
