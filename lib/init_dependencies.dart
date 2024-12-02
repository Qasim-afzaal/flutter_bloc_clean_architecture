
import 'package:flutter_clean_architecture/core/secrets/app_secrets.dart';
import 'package:flutter_clean_architecture/features/auth_supabase/auth_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/data/repositories/auth_repo_imp.dart';
import 'package:flutter_clean_architecture/features/domain/usecases/auth_usecases/usecase_login.dart';
import 'package:flutter_clean_architecture/features/domain/usecases/auth_usecases/user_sign_up.dart';
import 'package:flutter_clean_architecture/features/presentation/state_managment/auth_bloc/auth_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator=GetIt.instance;
Future<void> initDependencies()async{
  _initAuth();
  await dotenv.load(fileName: "lib/.env");

// For Supabase
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseKey);
      serviceLocator.registerLazySingleton(() => supabase.client);
}


void _initAuth(){
serviceLocator.registerFactory<AuthRemoteDataSourceImp>(() => AuthRemoteDataSourceImp(serviceLocator()));
serviceLocator.registerFactory(() => AuthRepositoryImp(serviceLocator()));
serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));
serviceLocator.registerFactory(() => UserSignIn(serviceLocator()));
serviceLocator.registerLazySingleton(() => AuthBloc(userSignUp:serviceLocator() ,userSignIn:serviceLocator() ));




}