import 'package:flutter_clean_architecture/core/utils/helpers.dart';
import 'package:flutter_clean_architecture/features/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signupEmailPassword(
      {required String name, required String email, required String password});
  Future<UserModel> loginWithEmail(
      {required String email, required String password});
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImp(this.supabaseClient);

  @override
  Future<UserModel> loginWithEmail(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        Helpers.snackbars
            .error(title: "Exception", message: "User data is null");
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signupEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signUp(email: email, password: password, data: {'name': name});
      if (response.user == null) {
        Helpers.snackbars
            .error(title: "Exception", message: "User data is null");
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
