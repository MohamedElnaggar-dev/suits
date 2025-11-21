import 'package:get_it/get_it.dart';
import 'package:suits_app/features/auth/data/data_source/firebase_auth_service.dart';
import 'package:suits_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:suits_app/features/auth/domain/repo/auth_repo.dart';
import 'package:suits_app/features/auth/domain/usecase/register_user_use_case.dart';
import 'package:suits_app/features/auth/domain/usecase/signin_use_case.dart';
import 'package:suits_app/features/auth/presentation/manger/signin_cubit/signin_cubit.dart';
import 'package:suits_app/features/auth/presentation/manger/signup_cubit/signup_cubit.dart';

final injector = GetIt.instance;

Future<void> setupLocator() async {
  /// Services

  injector.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(),
  );

  ///  Repositories
  injector.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(injector<FirebaseAuthService>()),
  );

  /// useCases
  injector.registerLazySingleton<RegisterUserUseCase>(
    () => RegisterUserUseCase(authRepo: injector<AuthRepo>()),
  );

  injector.registerLazySingleton<SigninUseCase>(
    () => SigninUseCase(authRepo: injector<AuthRepo>()),
  );

  /// Blocs / Cubits
  injector.registerFactory<SignupCubit>(
    () => SignupCubit(injector<RegisterUserUseCase>()),
  );

  injector.registerFactory<SigninCubit>(
    () => SigninCubit(injector<SigninUseCase>()),
  );
}
