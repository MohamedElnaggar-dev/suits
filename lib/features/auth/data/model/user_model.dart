import 'package:firebase_auth/firebase_auth.dart';
import 'package:suits_app/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String email;
  final String name;
  final String uId;

  UserModel({required this.email, required this.name, required this.uId});

  factory UserModel.fromFireBase(User user) {
    return UserModel(
      email: user.email ?? '',
      name: user.displayName ?? '',
      uId: user.uid,
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(email: user.email, name: user.name, uId: user.uId);
  }

  UserEntity toEntity() {
    return UserEntity(name: name, email: email, uId: uId);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, String> toJson() {
    return {'uid': uId, 'name': name, 'email': email};
  }
}
