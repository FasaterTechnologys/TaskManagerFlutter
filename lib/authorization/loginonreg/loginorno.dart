import 'package:firebase_auth/firebase_auth.dart';

Future<dynamic> loginOrNo() async {
  String? log;
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user?.uid == null) {
      log = "null";
    } else if (user?.emailVerified == false) {
      log = "mail";
    } else {
      log = "true";
    }
  });

  return log;
}
