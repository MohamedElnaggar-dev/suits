abstract class OtpRepo {
  Future<void> sendOtpToEmail({required String email, required String uid});
  Future<bool> verifyOtp({required String uid, required String enteredOtp});
  Future<bool> canResendOtp({required String uid});
}
