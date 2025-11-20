import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:suits_app/core/utils/error_handeling/custom_excption.dart';

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

      User user = userCredential.user!;

      await firebaseFirestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'name': name,
        'email': email,
      });
      await user.updateDisplayName(name);
      await user.reload();
      await firebaseFirestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'name': name,
        'email': email,
      });
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
            errMessage: e.message ?? 'Unknown FirebaseAuth error.',
          );
      }
    } catch (e) {
      throw CustomException(errMessage: e.toString());
    }
  }
}
