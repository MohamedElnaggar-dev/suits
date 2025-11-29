import 'package:dartz/dartz.dart';
import 'package:suits_app/core/utils/error_handeling/failure.dart';
import 'package:suits_app/features/auth/domain/repo/auth_repo.dart';

class SignInWithGoogleUseCase {
  final AuthRepo authRepo;
  SignInWithGoogleUseCase({required this.authRepo});

  Future<Either<CustomFailure, Unit>> call() async {
    return authRepo.signInWithGoogle();
  }
}
