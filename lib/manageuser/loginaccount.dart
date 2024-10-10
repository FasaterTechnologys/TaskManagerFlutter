import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential?> loginAccount(String mail, String password) async {
  try {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail, password: password);
    return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      return null;
    } else {
      rethrow;
    }
  }
}
