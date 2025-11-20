import 'package:dartz/dartz.dart';
import 'package:suits_app/core/utils/error_handeling/failure.dart';
import 'package:suits_app/features/auth/domain/entities/user_entity.dart';
import 'package:suits_app/features/auth/domain/repo/auth_repo.dart';

class RegisterUserUseCase {
  final AuthRepo authRepo;

  RegisterUserUseCase({required this.authRepo});

  Future<Either<CustomFailure, UserEntity>> call({
    required String email,
    required String password,
    required String name,
  }) {
    return authRepo.createUserwithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
  }
}
