import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserData {
  String date;
  bool premium;
  List<dynamic> data;
  String name;
  String uid;

  UserData({
    required this.date,
    required this.premium,
    required this.data,
    required this.name,
    required this.uid,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      date: json['date'],
      premium: json['premium'],
      data: json['data'],
      name: json['name'],
      uid: json['uid'],
    );
  }
}

Future<void> loadData(FirebaseDatabase database, String user, UserData userData,
    Function callback, BuildContext context) async {
  try {
    DatabaseEvent event = await database.ref().child("users/$user").once();
    DataSnapshot snapshot = event.snapshot;

    if (snapshot.exists) {
      Map<String, dynamic> jsonData =
          Map<String, dynamic>.from(snapshot.value as Map);

      List<dynamic> dataList;
      if (jsonData['data'] is List) {
        dataList = jsonData['data'];
      } else {
        dataList = [];
      }

      userData.date = jsonData['date'];
      userData.premium = jsonData['premium'];
      userData.data = dataList;
      userData.name = jsonData['name'];
      userData.uid = jsonData['uid'];

      callback();
    } else {
      await FirebaseAuth.instance.signOut();
      final navigator = Navigator.of(context);
      navigator.pushNamedAndRemoveUntil(
          "/login", (Route<dynamic> route) => false);
    }
  } catch (e) {
    print('Ошибка при загрузке данных: $e');
  }
}
