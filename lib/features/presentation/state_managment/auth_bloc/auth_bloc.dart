import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/domain/entities/user.dart';
import 'package:flutter_clean_architecture/features/domain/usecases/auth_usecases/usecase_login.dart';
import 'package:flutter_clean_architecture/features/domain/usecases/auth_usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  AuthBloc({required UserSignUp userSignUp,required UserSignIn userSignIn})
      : _userSignUp = userSignUp,_userSignIn=userSignIn,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
    final res=  await _userSignUp(UserSignUpParams(
          name: event.name, email: event.email, password: event.password));
          res.fold((l) => emit(AuthFailure((l.message))), (r) => emit(AuthSuccess(r)));
    });
    on<AuthSignIn>((event, emit) async{
      emit(AuthLoading());
     final res =await _userSignIn( UserSignInParams(email: event.email, password: event.password));
     res.fold((l) => emit(AuthFailure((l.message))), (r) => emit(AuthSuccess(r)));
     });
     
  }
}
