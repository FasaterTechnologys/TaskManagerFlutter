import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/authorization/loginonreg/email_aunt.dart';
import 'package:intl/intl.dart';

Future<void> aunt(String mail, String password, BuildContext context,
    Function(String) update) async {
  try {
    final user = FirebaseAuth.instance;
    await user.createUserWithEmailAndPassword(
      email: mail.trim(),
      password: password.trim(),
    );
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("users/${user.currentUser!.uid}");

    await ref.set({
      "name": "User",
      "date": getFormattedDateTime(),
      "premium": false,
      "data": "[]"
    });

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                const EmailVerificationScreen()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      update("Слабый пароль.");
    } else if (e.code == 'email-already-in-use') {
      log("Почта используется");
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: mail, password: password);
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          update("Неверный пароль.");
        } else {
          log("Пизда забанили ${e.code}");
          update("Слишком много запросов.");
        }
      }
      log("Закончилось");
    } else {
      print(e.code);
      update(e.code);
    }
  } catch (e) {
    print(e);
  }
}

DateTime getCurrentDateTime() {
  return DateTime.now();
}

String getFormattedDateTime() {
  DateTime now = getCurrentDateTime();
  String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
  return formattedDate;
}
