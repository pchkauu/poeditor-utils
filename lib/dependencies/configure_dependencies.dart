import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:poeditor_utils/dependencies/_barrel.dart';

final getIt = GetIt.instance;
bool isGetItInit = false;

@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init();
  isGetItInit = true;
}
