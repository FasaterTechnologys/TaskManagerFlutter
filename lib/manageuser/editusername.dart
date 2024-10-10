import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

Future editUserName(TextEditingController nameController, String user) async {
  if (nameController.text.length < 2 || nameController.text.length > 20) return;
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/$user");
  await ref.update({
    "name": nameController.text,
  });
}
