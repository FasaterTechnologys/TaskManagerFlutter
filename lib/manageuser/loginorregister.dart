import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskmanager/manageuser/creataccount.dart';
import 'package:taskmanager/manageuser/loginaccount.dart';

Future<String> loginOrRegister(String mail, String password) async {
  try {
    final userCredential = await loginAccount(mail, password);
    if (userCredential?.user != null) {
      return "home";
    } else {
      await createAccount(mail, password);
      return "mail";
    }
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'weak-password':
        return "Слабый пароль.";
      case 'wrong-password' || 'email-already-in-use':
        return "Неверный пароль.";
      default:
        log("Ошибка авторизации: ${e.code}");
        return "Ошибка авторизации.";
    }
  } catch (e) {
    return e.toString();
  }
}
