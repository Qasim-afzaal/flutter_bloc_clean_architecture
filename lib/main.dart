import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/presentation/state_managment/auth_bloc/auth_bloc.dart';
import 'package:flutter_clean_architecture/init_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures all bindings are ready before app initialization.

  try {
    // Initialize dependencies like APIs, services, and blocs.
    await initDependencies();
    runApp(MyApp());
  } catch (e) {
    // Handle errors during initialization.
    debugPrint('Failed to initialize dependencies: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => serviceLocator<AuthBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clean Architecture App',
        theme: ThemeData.light(),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Clean Architecture App!'),
      ),
    );
  }
}
