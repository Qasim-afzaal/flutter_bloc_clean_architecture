import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/secrets/app_secrets.dart';
import 'package:flutter_clean_architecture/features/auth_supabase/auth_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/data/repositories/auth_rep_imp.dart';
import 'package:flutter_clean_architecture/features/domain/usercases/auth_usecases/usecase_login.dart';
import 'package:flutter_clean_architecture/features/domain/usercases/auth_usecases/user_sign_up.dart';
import 'package:flutter_clean_architecture/features/presentation/state_managment/bloc/auth_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // For Backend Apis
  await dotenv.load(fileName: "lib/.env");

// For Supabase
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseKey);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthBloc(
          userSignUp: UserSignUp(
            AuthRepositoryImp(
              AuthRemoteDataSourceImp(supabase.client),
            ),
          ), userSignIn:  UserSignIn(
            AuthRepositoryImp(
              AuthRemoteDataSourceImp(supabase.client),
            ),
          ),
        ),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
