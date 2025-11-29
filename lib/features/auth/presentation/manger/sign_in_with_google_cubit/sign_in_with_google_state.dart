part of 'sign_in_with_google_cubit.dart';

sealed class SignInWithGoogleState extends Equatable {
  const SignInWithGoogleState();

  @override
  List<Object> get props => [];
}

final class SignInWithGoogleInitial extends SignInWithGoogleState {}

final class SignInWithGoogleLoading extends SignInWithGoogleState {}

final class SignInWithGoogleSuccess extends SignInWithGoogleState {}

final class SignInWithGoogleFailure extends SignInWithGoogleState {
  final String errorMessage;

  const SignInWithGoogleFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
