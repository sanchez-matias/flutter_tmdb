import 'package:flutter_tmdb/src/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.avatarPath,
    required super.id,
    required super.name,
    required super.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        avatarPath: json['avatar']['tmdb']['avatar_path'],
        id: json['id'].toString(),
        name: json['name'],
        username: json['username'],
      );
}
