import 'package:flutter_clean_architecture/core/usecase/usercase.dart';

import 'package:flutter_clean_architecture/features/domain/entities/user.dart';
import 'package:flutter_clean_architecture/features/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/theme/error/failure.dart';

class UserSignIn implements UserCase<User, UserSignInParams> {
  final AuthRepository authRepository;
  UserSignIn(this.authRepository);
  @override
  Future<Either<Failure, dynamic>> call(UserSignInParams params) async {
    return await authRepository.loginWithEmail(
        email: params.email, password: params.password);
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({required this.email, required this.password});
}
