import 'package:flutter_clean_architecture/core/secrets/app_secrets.dart';
import 'package:flutter_clean_architecture/features/auth_supabase/auth_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/data/repositories/auth_repo_imp.dart';
import 'package:flutter_clean_architecture/features/domain/usecases/auth_usecases/usecase_login.dart';
import 'package:flutter_clean_architecture/features/domain/usecases/auth_usecases/user_sign_up.dart';
import 'package:flutter_clean_architecture/features/presentation/state_managment/auth_bloc/auth_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  await _initializeEnvironment();
  await _initializeSupabase();
  _registerAuthDependencies();
}

/// Loads environment variables from the .env file.
Future<void> _initializeEnvironment() async {
  await dotenv.load(fileName: "lib/.env");
}

/// Initializes the Supabase client and registers it in the service locator.
Future<void> _initializeSupabase() async {
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

/// Registers authentication-related dependencies.
void _registerAuthDependencies() {
  // Data sources
  serviceLocator.registerFactory<AuthRemoteDataSourceImp>(
    () => AuthRemoteDataSourceImp(serviceLocator()),
  );

  // Repositories
  serviceLocator.registerFactory(
    () => AuthRepositoryImp(serviceLocator()),
  );

  // Use cases
  serviceLocator.registerFactory(
    () => UserSignUp(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => UserSignIn(serviceLocator()),
  );

  // State management
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userSignIn: serviceLocator(),
    ),
  );
}
