import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/presentation/state_managment/auth_bloc/auth_bloc.dart';
import 'package:flutter_clean_architecture/init_dependencies.dart';

void main() async {
  // For Backend Apis
await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => serviceLocator<AuthBloc>(),
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
