import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:taskmanager/consts.dart';

Future createAccount(String mail, String password) async {
  try {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: mail.trim(), password: password.trim());
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("users/${userCredential.user!.uid}");
    await ref.set({
      "uid": userCredential.user!.uid,
      "name": "User",
      "date": getFormattedDateTime(),
      "premium": false,
      "data": "[]"
    });
    return userCredential;
  } catch (e) {
    rethrow;
  }
}
