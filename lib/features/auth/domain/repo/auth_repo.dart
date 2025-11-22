import 'package:dartz/dartz.dart';
import 'package:suits_app/core/utils/error_handeling/failure.dart';
import 'package:suits_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<CustomFailure, UserEntity>> createUserwithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<CustomFailure, UserEntity>> signinWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<CustomFailure, Unit>> forgetPassword({
    required String newPassword,
  });
}
