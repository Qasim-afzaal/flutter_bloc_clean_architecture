import 'package:flutter_clean_architecture/core/theme/error/failure.dart';
import 'package:flutter_clean_architecture/features/auth_supabase/auth_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/domain/entities/user.dart';
import 'package:flutter_clean_architecture/features/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImp(this.authRemoteDataSource);
  @override
  Future login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> loginWithEmail(
      {required String email, required String password}) async {
    return _getUser(() async => await authRemoteDataSource.loginWithEmail(
        email: email, password: password));
  }

  @override
  Future signup() {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> signupEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    return _getUser(() async => await authRemoteDataSource.signupEmailPassword(
        name: name, email: email, password: password));
  }

  Future<Either<Failure, dynamic>> _getUser(Future<User> Function() fn) async {
    try {
      final user = await fn();
      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
