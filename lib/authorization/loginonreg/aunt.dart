import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

Future<String> aunt(String mail, String password, String error) async {
  String error = "";
  try {
    final user = FirebaseAuth.instance;
    await user.createUserWithEmailAndPassword(
      email: mail.trim(),
      password: password.trim(),
    );
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("users/${user.currentUser!.uid}");

    await ref.set(
      {
        "uid": user.currentUser!.uid,
        "name": "User",
        "date": getFormattedDateTime(),
        "premium": false,
        "data": "[]"
      },
    );

    error = "mail-check";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      error = "Слабый пароль.";
    } else if (e.code == 'email-already-in-use') {
      log("Почта используется");
      try {
        final user = FirebaseAuth.instance;
        await user.signInWithEmailAndPassword(email: mail, password: password);
        if (user.currentUser?.emailVerified == false) {
          error = "mail-check";
        } else {
          error = "nice";
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          error = "Неверный пароль.";
        } else {
          log("Много запросов ${e.code}");
          error = "Слишком много запросов.";
        }
      }
      log("Закончилось");
    } else {
      error = e.code;
    }
  } catch (e) {
    log(e.toString());
  }
  return error;
}

DateTime getCurrentDateTime() {
  return DateTime.now();
}

String getFormattedDateTime() {
  DateTime now = getCurrentDateTime();
  String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
  return formattedDate;
}
