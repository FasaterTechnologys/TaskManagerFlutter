import 'package:firebase_auth/firebase_auth.dart';

bool checkVerifEmail() {
  final user = FirebaseAuth.instance.currentUser;
  if (user?.emailVerified == false) {
    return true;
  } else {
    return false;
  }
}
