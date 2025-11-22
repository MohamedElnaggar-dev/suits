import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:suits_app/features/auth/domain/usecase/otp_use_case.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this.otpUseCase) : super(OtpInitial());
  final OtpUseCase otpUseCase;

  Future<void> sendOtpToEmail({
    required String email,
    required String uid,
  }) async {
    emit(OtpLoading());
    try {
      await otpUseCase.sendOtpToEmail(email: email, uid: uid);
      emit(const OtpSentSuccess(message: "OTP sent successfully"));
    } catch (e) {
      emit(OtpFailure(errorMessage: e.toString()));
    }
  }

  Future<void> verifyOtp({
    required String uid,
    required String enteredOtp,
  }) async {
    emit(OtpLoading());
    try {
      final isValid = await otpUseCase.verifyOtp(
        uid: uid,
        enteredOtp: enteredOtp,
      );
      if (isValid) {
        emit(const OtpVerifiedSuccess(message: "OTP verified successfully"));
      } else {
        emit(const OtpFailure(errorMessage: "Invalid OTP"));
      }
    } catch (e) {
      emit(OtpFailure(errorMessage: e.toString()));
    }
  }

  Future<bool> canResendOtp({required String uid}) async {
    return await otpUseCase.canResendOtp(uid: uid);
  }
}
