import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/dataLoad.dart';
import 'package:taskmanager/global.dart';

class ProfileContainer extends StatefulWidget {
  final Function logout;
  const ProfileContainer(this.logout, {super.key});

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  final user = FirebaseAuth.instance.currentUser;
  final database = FirebaseDatabase.instance;
  UserData userDecode = UserData(date: '', premium: false, data: [], name: '');
  final TextEditingController _nameController = TextEditingController();

  void loadUpdate() {
    loadData(database, user!.uid, userDecode, () {
      setState(() {
        _nameController.text = userDecode.name;
        String fullName = userDecode.name;
        userDecode.name =
            fullName.length > 10 ? '${fullName.substring(0, 10)}...' : fullName;
      });
    });
  }

  @override
  void initState() {
    loadUpdate();
    super.initState();
  }

  void _showNameChangeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Изменить имя"),
          content: TextField(
            controller: _nameController,
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
                DatabaseReference ref =
                    FirebaseDatabase.instance.ref("users/${user!.uid}");

                await ref.update({
                  "name": _nameController.text,
                });
                loadUpdate();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (userDecode.name != "") {
      return Container(
        width: widthScreen * 0.8,
        height: heigtScreen * 0.25,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 54, 51, 51).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ], color: container, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    child: Container(
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: heigtScreen * 0.04,
                      ),
                    ),
                    onTap: () {
                      widget.logout();
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.person,
                    size: heigtScreen * 0.1,
                    color: Colors.white,
                  ),
                  Row(
                    children: [
                      Text(userDecode.name, style: appTextStyle),
                      SizedBox(
                        width: widthScreen * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showNameChangeDialog();
                        },
                        child: Icon(
                          Icons.edit,
                          size: heigtScreen * 0.04,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: widthScreen * 0.01,
                  ),
                  Text(
                      userDecode.premium == true
                          ? "Премиум есть"
                          : "Премиум нет",
                      style: appTextStyle),
                ],
              )
            ],
          ),
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
