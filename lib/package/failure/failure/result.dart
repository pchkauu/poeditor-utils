import 'package:either_dart/either.dart';
import 'package:poeditor_utils/package/failure/_barrel.dart';

typedef Result<T> = Either<Failure, T>;
