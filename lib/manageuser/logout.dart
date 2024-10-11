import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  if (context.mounted) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil("/login", (Route<dynamic> route) => false);
  }
}
