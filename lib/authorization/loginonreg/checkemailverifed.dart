import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

checkEmailVerified(BuildContext context, Timer? timer, Function update,
    final navigator) async {
  await FirebaseAuth.instance.currentUser?.reload();
  bool isEmailVerified = false;
  isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  update();
  if (isEmailVerified) {
    timer?.cancel();
    navigator.pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
  }
}
