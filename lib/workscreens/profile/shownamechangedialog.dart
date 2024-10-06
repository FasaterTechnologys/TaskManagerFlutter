import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void showNameChangeDialog(BuildContext context,
    TextEditingController nameController, final user, Function loadUpdate) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Изменить имя"),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(hintText: "Введите новое имя"),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Отмена"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("Сохранить"),
            onPressed: () {
              if (nameController.text.length < 2 ||
                  nameController.text.length > 20) return;
              upDateName(nameController, user);
              loadUpdate();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void upDateName(
  TextEditingController nameController,
  final user,
) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/${user!.uid}");

  await ref.update({
    "name": nameController.text,
  });
}
