import 'dart:async';

import '../../utils/either.dart';

abstract interface class UseCase<Error, Success, Params> {
  /// Выполнение `UseCase`
  FutureOr<Either<Error, Success>> call(Params params);
}