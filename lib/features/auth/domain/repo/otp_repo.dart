abstract class OtpRepo {
  Future<void> sendOtpToEmail({required String email, required String uid});
}
