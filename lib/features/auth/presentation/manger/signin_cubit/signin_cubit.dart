import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:suits_app/features/auth/domain/entities/user_entity.dart';
import 'package:suits_app/features/auth/domain/usecase/signin_use_case.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.signinUseCase) : super(SigninInitial());
  final SigninUseCase signinUseCase;

  Future<void> signin({required String email, required String password}) async {
    emit(SigninLoading());
    final result = await signinUseCase.call(email: email, password: password);

    result.fold(
      (failure) => emit(SigninFailure(errorMessage: failure.errMessage)),
      (user) => emit(SigninSuccess(user: user)),
    );
  }
}
