import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

checkEmailVerified(
  BuildContext context,
  Timer? timer,
  Function update,
) async {
  await FirebaseAuth.instance.currentUser?.reload();
  bool isEmailVerified = false;
  isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  update();
  if (isEmailVerified) {
    // TODO: implement your code after email verification
    timer?.cancel();
    final navigator = Navigator.of(context);
    navigator.pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
  }
}
