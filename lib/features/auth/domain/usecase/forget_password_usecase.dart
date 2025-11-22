import 'package:dartz/dartz.dart';
import 'package:suits_app/core/utils/error_handeling/failure.dart';
import 'package:suits_app/features/auth/domain/repo/auth_repo.dart';

class ForgetPasswordUseCase {
  final AuthRepo authRepo;
  ForgetPasswordUseCase({required this.authRepo});

  Future<Either<CustomFailure, Unit>> call({required String newPassword}) {
    return authRepo.forgetPassword(newPassword: newPassword);
  }
}
