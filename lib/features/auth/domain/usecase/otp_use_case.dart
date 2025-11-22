import 'package:suits_app/features/auth/domain/repo/otp_repo.dart';

class OtpUseCase {
  final OtpRepo otpRepo;
  OtpUseCase({required this.otpRepo});

  Future<bool> canResendOtp({required String uid}) =>
      otpRepo.canResendOtp(uid: uid);
  Future<void> sendOtpToEmail({required String email, required String uid}) {
    return otpRepo.sendOtpToEmail(email: email, uid: uid);
  }

  Future<bool> verifyOtp({required String uid, required String enteredOtp}) {
    return otpRepo.verifyOtp(uid: uid, enteredOtp: enteredOtp);
  }
}
