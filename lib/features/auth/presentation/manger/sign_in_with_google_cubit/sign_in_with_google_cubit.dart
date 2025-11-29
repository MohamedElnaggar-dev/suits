import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:suits_app/features/auth/domain/usecase/sigin_with_google_usecase.dart';

part 'sign_in_with_google_state.dart';

class SignInWithGoogleCubit extends Cubit<SignInWithGoogleState> {
  SignInWithGoogleCubit(this.signInWithGoogleUseCase)
    : super(SignInWithGoogleInitial());
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  Future<void> signInWithGoogle() async {
    emit(SignInWithGoogleLoading());
    final result = await signInWithGoogleUseCase();
    result.fold(
      (failure) => emit(SignInWithGoogleFailure(failure.errMessage)),
      (_) => emit(SignInWithGoogleSuccess()),
    );
  }
}
