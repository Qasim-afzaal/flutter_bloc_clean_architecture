import 'package:flutter_clean_architecture/core/theme/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<dynamic> login();
  Future<dynamic> signup();
  Future<Either<Failure, dynamic>> signupEmailPassword(
      {required String name, required String email, required String password});
  Future<Either<Failure, dynamic>> loginWithEmail(
      {required String email, required String password});
}
