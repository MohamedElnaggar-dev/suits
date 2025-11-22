part of 'otp_cubit.dart';

sealed class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

final class OtpInitial extends OtpState {}

final class OtpLoading extends OtpState {}

final class OtpSentSuccess extends OtpState {
  final String message;

  const OtpSentSuccess({required this.message});
}

final class OtpVerifiedSuccess extends OtpState {
  final String message;

  const OtpVerifiedSuccess({required this.message});
}

final class OtpFailure extends OtpState {
  final String errorMessage;
  const OtpFailure({required this.errorMessage});
}
