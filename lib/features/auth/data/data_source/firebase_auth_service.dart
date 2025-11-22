import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:suits_app/core/utils/error_handeling/custom_excption.dart';
import 'package:suits_app/features/auth/data/data_source/local_storage_service.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<User> createUserwithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;
      if (user == null) {
        throw CustomException(errMessage: 'User creation failed.');
      }

      await firebaseFirestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'name': name,
        'email': user.email,
      });
      await LocalStorageService.saveUserData(
        uid: user.uid,
        email: user.email!,
        name: name,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          throw CustomException(
            errMessage: 'The password provided is too weak.',
          );
        case 'email-already-in-use':
          throw CustomException(
            errMessage: 'The account already exists for that email.',
          );
        case 'invalid-email':
          throw CustomException(errMessage: 'The email address is invalid.');
        case 'operation-not-allowed':
          throw CustomException(
            errMessage: 'Email/Password accounts are not enabled.',
          );
        default:
          throw CustomException(
            errMessage:
                e.message ?? 'there was an error occurred from firebase.',
          );
      }
    } catch (e) {
      throw CustomException(errMessage: e.toString());
    }
  }

  Future<User> signinWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
      if (user == null) {
        throw CustomException(errMessage: 'User sign in failed.');
      }
      await firebaseFirestore.collection('users').doc(user.uid).set({
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw CustomException(errMessage: 'The email address is invalid.');
        case 'user-disabled':
          throw CustomException(
            errMessage: 'This user account has been disabled.',
          );
        case 'user-not-found':
          throw CustomException(errMessage: 'No user found for that email.');
        case 'wrong-password':
          throw CustomException(errMessage: 'Wrong password provided.');
        default:
          throw CustomException(
            errMessage: e.message ?? 'Unknown FirebaseAuth error.',
          );
      }
    } catch (e) {
      throw CustomException(errMessage: e.toString());
    }
  }

  // Future<void> signOut() async {
  //   try {
  //     await firebaseAuth.signOut();
  //     await LocalStorageService.clearUserData();
  //   } catch (e) {
  //     throw CustomException(errMessage: 'Sign out failed: ${e.toString()}');
  //   }
  // }

  Future<void> forgetPassword({required String newPassword}) async {
    try {
      final user = firebaseAuth.currentUser;
      if (user == null) {
        throw CustomException(errMessage: 'No user is currently signed in.');
      }
      await user.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      throw CustomException(
        errMessage: e.message ?? 'Failed to update password.',
      );
    } catch (e) {
      throw CustomException(errMessage: e.toString());
    }
  }
}
