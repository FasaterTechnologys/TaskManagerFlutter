import 'package:firebase_auth/firebase_auth.dart';

checkEmailVerified() async {
  await FirebaseAuth.instance.currentUser?.reload();
  bool isEmailVerified = false;
  isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  if (isEmailVerified) {
    return true;
  } else {
    return false;
  }
}
