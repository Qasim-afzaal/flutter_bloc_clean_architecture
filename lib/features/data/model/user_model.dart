import 'package:flutter_clean_architecture/features/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.email,
    required super.id,
    required super.name,
  });

  /// Factory constructor to create a `UserModel` from JSON data.
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? "",
      id: map['id'] ?? "",
      name: map['name'] ?? "",
    );
  }
}
