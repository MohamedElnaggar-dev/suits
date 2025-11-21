import 'package:dartz/dartz.dart';
import 'package:suits_app/core/utils/error_handeling/custom_excption.dart';
import 'package:suits_app/core/utils/error_handeling/failure.dart';
import 'package:suits_app/features/auth/data/data_source/firebase_auth_service.dart';
import 'package:suits_app/features/auth/data/model/user_model.dart';
import 'package:suits_app/features/auth/domain/entities/user_entity.dart';
import 'package:suits_app/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl(this.firebaseAuthService);
  @override
  Future<Either<CustomFailure, UserEntity>> createUserwithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final user = await firebaseAuthService.createUserwithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );

      UserModel userModel = UserModel.fromFireBase(user);
      userModel = UserModel(
        email: userModel.email,
        name: name,
        uId: userModel.uId,
      );
      return Right(userModel.toEntity());
    } on CustomException catch (e) {
      return Left(CustomFailure(errMessage: e.errMessage));
    }
  }

  @override
  Future<Either<CustomFailure, UserEntity>> signinWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthService.signinWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel.fromFireBase(user);
      return Right(userModel.toEntity());
    } on CustomException catch (e) {
      return Left(CustomFailure(errMessage: e.errMessage));
    }
  }
}
