
import 'package:flutter_clean_architecture/core/usecase/usercase.dart';
import 'package:flutter_clean_architecture/features/domain/entities/user.dart';
import 'package:flutter_clean_architecture/features/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/theme/error/failure.dart';


class UserSignUp implements UserCase<User, UserSignUpParams>{
  final AuthRepository authRepository;
  UserSignUp(this.authRepository); 
  @override
  Future<Either<Failure, dynamic>> call(UserSignUpParams params)async {
 return  await authRepository.signupEmailPassword(name: params.name, email: params.email, password: params.password);
  }

   


}

class UserSignUpParams{
  
  final String email;
  final String  password;
  final String name;

  UserSignUpParams({required this.name,required this.email,required this.password});

}