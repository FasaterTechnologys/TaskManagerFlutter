import 'package:flutter/material.dart';
import 'package:taskmanager/manageuser/editusername.dart';

void showNameChangeDialog(
  BuildContext context,
  TextEditingController nameController,
  String user,
  Function refreshData,
) {
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
            onPressed: () async {
              await editUserName(
                nameController,
                user,
              );
              if (context.mounted) {
                Navigator.of(context).pop();
                refreshData();
              }
            },
          ),
        ],
      );
    },
  );
}
