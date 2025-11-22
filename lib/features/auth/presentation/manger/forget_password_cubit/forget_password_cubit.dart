import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:suits_app/features/auth/domain/usecase/forget_password_usecase.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordUseCase)
    : super(ForgetPasswordInitial());
  final ForgetPasswordUseCase forgetPasswordUseCase;

  Future<void> forgetPassword({required String newPassword}) async {
    emit(ForgetPasswordLoading());
    final result = await forgetPasswordUseCase.call(newPassword: newPassword);

    result.fold(
      (failure) =>
          emit(ForgetPasswordFailure(errorMessage: failure.errMessage)),
      (_) => emit(
        const ForgetPasswordSuccess(message: 'Password reset successful'),
      ),
    );
  }
}
