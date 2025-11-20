import 'package:get_it/get_it.dart';
import 'package:suits_app/features/auth/data/data_source/firebase_auth_service.dart';
import 'package:suits_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:suits_app/features/auth/domain/repo/auth_repo.dart';
import 'package:suits_app/features/auth/domain/usecase/register_user_use_case.dart';
import 'package:suits_app/features/auth/presentation/manger/signup_cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  /// Services

  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

  ///  Repositories
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<FirebaseAuthService>()),
  );

  /// useCases
  getIt.registerLazySingleton<RegisterUserUseCase>(
    () => RegisterUserUseCase(authRepo: getIt<AuthRepo>()),
  );

  /// Blocs / Cubits
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(getIt<RegisterUserUseCase>()),
  );
}
