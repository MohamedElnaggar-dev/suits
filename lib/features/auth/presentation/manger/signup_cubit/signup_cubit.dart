import 'package:equatable/equatable.dart';
import 'package:suits_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suits_app/features/auth/domain/usecase/register_user_use_case.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.registerUserUseCase) : super(SignupInitial());
  final RegisterUserUseCase registerUserUseCase;

  Future<void> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupLoading());
    final result = await registerUserUseCase.call(
      email: email,
      password: password,
      name: name,
    );

    result.fold(
      (failure) => emit(SignupFailure(errorMessage: failure.errMessage)),
      (user) => emit(SignupSuccess(user: user)),
    );
  }
}
