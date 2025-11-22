import 'package:suits_app/features/auth/data/data_source/otp_service.dart';
import 'package:suits_app/features/auth/domain/repo/otp_repo.dart';

class OtpRepoImpl implements OtpRepo {
  final OtpService otpService;
  OtpRepoImpl({required this.otpService});
  @override
  Future<void> sendOtpToEmail({
    required String email,
    required String uid,
  }) async {
    final otp = otpService.generateOtp();
    await otpService.saveOtp(uid, otp);
    await otpService.sendOtpToEmail(email, otp);
  }

  @override
  Future<bool> verifyOtp({
    required String uid,
    required String enteredOtp,
  }) async {
    return otpService.verifyOtp(uid, enteredOtp);
  }
}
