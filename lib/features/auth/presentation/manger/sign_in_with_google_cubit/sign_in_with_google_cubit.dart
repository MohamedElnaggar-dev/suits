import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_with_google_state.dart';

class SignInWithGoogleCubit extends Cubit<SignInWithGoogleState> {
  SignInWithGoogleCubit() : super(SignInWithGoogleInitial());
}
