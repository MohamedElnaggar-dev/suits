import 'package:dartz/dartz.dart';
import 'package:suits_app/core/utils/error_handeling/failure.dart';
import 'package:suits_app/features/auth/domain/entities/user_entity.dart';
import 'package:suits_app/features/auth/domain/repo/auth_repo.dart';

class SigninUseCase {
  final AuthRepo authRepo;
  SigninUseCase({required this.authRepo});

  Future<Either<CustomFailure, UserEntity>> call({
    required String email,
    required String password,
  }) {
    return authRepo.signinWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
