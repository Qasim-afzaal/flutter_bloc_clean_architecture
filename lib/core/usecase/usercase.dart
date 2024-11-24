import 'package:flutter_clean_architecture/core/theme/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UserCase<T,Params> {
  Future<Either<Failure, T>> call(Params params);
}
