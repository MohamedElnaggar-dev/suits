import 'package:get_it/get_it.dart';
import 'package:suits_app/features/auth/data/data_source/firebase_auth_service.dart';
import 'package:suits_app/features/auth/data/data_source/otp_service.dart';
import 'package:suits_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:suits_app/features/auth/data/repo_impl/otp_repo_impl.dart';
import 'package:suits_app/features/auth/domain/repo/auth_repo.dart';
import 'package:suits_app/features/auth/domain/repo/otp_repo.dart';
import 'package:suits_app/features/auth/domain/usecase/forget_password_usecase.dart';
import 'package:suits_app/features/auth/domain/usecase/otp_use_case.dart';
import 'package:suits_app/features/auth/domain/usecase/register_user_use_case.dart';
import 'package:suits_app/features/auth/domain/usecase/sigin_with_google_usecase.dart';
import 'package:suits_app/features/auth/domain/usecase/signin_use_case.dart';
import 'package:suits_app/features/auth/presentation/manger/forget_password_cubit/forget_password_cubit.dart';
import 'package:suits_app/features/auth/presentation/manger/otp_cubit/otp_cubit.dart';
import 'package:suits_app/features/auth/presentation/manger/sign_in_with_google_cubit/sign_in_with_google_cubit.dart';
import 'package:suits_app/features/auth/presentation/manger/signin_cubit/signin_cubit.dart';
import 'package:suits_app/features/auth/presentation/manger/signup_cubit/signup_cubit.dart';

final injector = GetIt.instance;

Future<void> setupLocator() async {
  /// Services

  injector.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(),
  );

  injector.registerLazySingleton<OtpService>(() => OtpService());

  ///  Repositories
  injector.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(injector<FirebaseAuthService>()),
  );
  injector.registerLazySingleton<OtpRepo>(
    () => OtpRepoImpl(otpService: injector<OtpService>()),
  );

  /// useCases
  injector.registerLazySingleton<RegisterUserUseCase>(
    () => RegisterUserUseCase(authRepo: injector<AuthRepo>()),
  );

  injector.registerLazySingleton<SigninUseCase>(
    () => SigninUseCase(authRepo: injector<AuthRepo>()),
  );

  injector.registerLazySingleton<ForgetPasswordUseCase>(
    () => ForgetPasswordUseCase(authRepo: injector<AuthRepo>()),
  );
  injector.registerLazySingleton<OtpUseCase>(
    () => OtpUseCase(otpRepo: injector<OtpRepo>()),
  );

  injector.registerLazySingleton<SignInWithGoogleUseCase>(
    () => SignInWithGoogleUseCase(authRepo: injector<AuthRepo>()),
  );

  /// Blocs / Cubits
  injector.registerFactory<SignupCubit>(
    () => SignupCubit(injector<RegisterUserUseCase>()),
  );

  injector.registerFactory<SigninCubit>(
    () => SigninCubit(injector<SigninUseCase>()),
  );

  injector.registerFactory<ForgetPasswordCubit>(
    () => ForgetPasswordCubit(injector<ForgetPasswordUseCase>()),
  );

  injector.registerFactory<OtpCubit>(() => OtpCubit(injector<OtpUseCase>()));

  injector.registerFactory<SignInWithGoogleCubit>(
    () => SignInWithGoogleCubit(injector<SignInWithGoogleUseCase>()),
  );
}
