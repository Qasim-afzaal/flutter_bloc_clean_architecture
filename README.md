# flutter_bloc_clean_architecture

# Blog App 

A Flutter-based Blog App built with **Clean Architecture** principles for modular, scalable, and maintainable development. The app integrates **Supabase** for backend services, uses **fpdart** for functional programming concepts, and manages state with **Flutter Bloc**.

---

## Features

- **User Authentication**: Sign up, log in, and manage user sessions.
- **Create, Read, Update, Delete (CRUD)**: Manage blog posts with rich text content and media uploads.
- **Supabase Integration**: Use Supabase for database, authentication, and storage.
- **Offline Storage**: Cache user data with `shared_preferences`.
- **Environment Configuration**: Securely manage environment variables with `flutter_dotenv`.
- **Dependency Injection**: Use `get_it` for DI to maintain a clean, testable architecture.
- **Functional Programming**: Leverage `fpdart` for robust error handling and result transformations.

---

## Architecture Overview

### Clean Architecture Layers

1. **Presentation Layer**:
   - Handles UI and state management.
   - Uses `Flutter Bloc` for state management and reactive updates.

2. **Domain Layer**:
   - Defines core business logic.
   - Includes entities, use cases, and repositories (abstract interfaces).

3. **Data Layer**:
   - Implements repositories using Supabase for backend communication.
   - Handles network requests and caching mechanisms.

---

## Packages Used

| **Package**           | **Purpose**                                      |
|------------------------|--------------------------------------------------|
| `fpdart`              | Functional programming and error handling.       |
| `supabase_flutter`    | Backend integration for database and auth.       |
| `path`                | File and directory path manipulation.            |
| `path_provider`       | Access to commonly used directories.             |
| `flutter_dotenv`      | Manage environment variables.                    |
| `shared_preferences`  | Local storage for lightweight caching.           |
| `flutter_bloc`        | State management and reactive architecture.      |
| `get_it`              | Dependency injection and service locator.        |

---

## Project Structure

```plaintext
lib/
├── core/
│   ├── error/            # Error handling (Failure classes)
│   ├── usecases/         # Common use case helpers
│   └── utils/            # Utility classes (constants, extensions)
├── data/
│   ├── models/           # Data models (DTOs)
│   ├── repositories/     # Repository implementations
│   └── datasources/      # Supabase API calls and local storage
├── domain/
│   ├── entities/         # Core app entities (e.g., BlogPost, User)
│   ├── repositories/     # Abstract repository interfaces
│   └── usecases/         # Business logic (e.g., CreatePostUseCase)
├── presentation/
│   ├── bloc/             # BLoC files (states, events, blocs)
│   ├── screens/          # UI screens (e.g., Home, Login, BlogDetails)
│   └── widgets/          # Reusable UI components
├── injection_container.dart  # Dependency injection setup
└── main.dart             # App entry point
```

---

## Setup Instructions

### Prerequisites

- Install Flutter SDK.
- Create a Supabase project and configure your backend.

### Environment Setup

1. Add a `.env` file in the root directory to store environment variables:
   ```env
   SUPABASE_URL=https://your-supabase-url.supabase.co
   SUPABASE_ANON_KEY=your-supabase-anon-key
   ```

2. Load environment variables in `main.dart`:
   ```dart
   import 'package:flutter_dotenv/flutter_dotenv.dart';

   Future<void> main() async {
     await dotenv.load(fileName: ".env");
     runApp(const MyApp());
   }
   ```

### Install Dependencies

Run the following command to get dependencies:
```bash
flutter pub get
```

---

## Key Features & Examples

### Dependency Injection

Set up services using `get_it` in `injection_container.dart`:

```dart
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

void setup() {
  // Register Supabase client
  sl.registerLazySingleton(() => Supabase.instance.client);

  // Register repositories and use cases
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl<SupabaseClient>()));
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
}
```

### Bloc Implementation

Example of a BLoC for managing blog posts:

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import 'blog_event.dart';
import 'blog_state.dart';
import '../../domain/usecases/get_posts_usecase.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final GetPostsUseCase getPosts;

  BlogBloc(this.getPosts) : super(BlogInitial()) {
    on<LoadPostsEvent>((event, emit) async {
      emit(BlogLoading());
      final result = await getPosts();
      result.fold(
        (failure) => emit(BlogError(failure.message)),
        (posts) => emit(BlogLoaded(posts)),
      );
    });
  }
}
```

### Supabase Integration

Fetch blog posts from Supabase:

```dart
import 'package:supabase_flutter/supabase_flutter.dart';

class BlogRemoteDatasource {
  final SupabaseClient client;

  BlogRemoteDatasource(this.client);

  Future<List<Map<String, dynamic>>> fetchBlogPosts() async {
    final response = await client.from('blogs').select().execute();
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
    return response.data as List<Map<String, dynamic>>;
  }
}
```

---

## Screenshots

*Add screenshots or gifs of the app here.*

---

## Future Enhancements

- Implement rich-text editing for blog content.
- Add user comments and likes for blogs.
- Enable push notifications for new blog updates.
- Introduce role-based access for admin and users.

---

## Contributing

Contributions are welcome! Follow these steps to contribute:

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature-name`.
3. Commit your changes: `git commit -m 'Add feature'`.
4. Push to the branch: `git push origin feature-name`.
5. Open a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
