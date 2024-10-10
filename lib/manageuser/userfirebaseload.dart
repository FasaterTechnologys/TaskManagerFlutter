import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:taskmanager/consts.dart';

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

class User {
  Future<bool> authenticateUser(
      FirebaseAuth auth, DataSnapshot snapshot) async {
    final user = auth.currentUser;
    if (user == null || !snapshot.exists) {
      logoutUser();
      return false;
    }
    return true;
  }

  logoutUser() async {
    FirebaseAuth.instance.currentUser;
    await FirebaseAuth.instance.signOut();
  }
}

class DataProcess {
  User user = User();
  dataSorting(DataSnapshot snapshot) async {
    Map<String, dynamic> jsonData =
        Map<String, dynamic>.from(snapshot.value as Map);

    List<dynamic> dataList;
    if (jsonData['data'] is List) {
      dataList = jsonData['data'];
    } else {
      dataList = [];
    }

    userDecode.date = jsonData['date'];
    userDecode.premium = jsonData['premium'];
    userDecode.data = dataList;
    userDecode.name = jsonData['name'];
    userDecode.uid = jsonData['uid'];
  }
}

class UserLoaded {
  Future loaduserData() async {
    final userAuth = User();
    DataProcess dataProcess = DataProcess();
    final user = FirebaseAuth.instance;
    final database = FirebaseDatabase.instance;
    DatabaseEvent event =
        await database.ref().child("users/${user.currentUser?.uid}").once();
    DataSnapshot snapshot = event.snapshot;

    if (await userAuth.authenticateUser(user, snapshot) == false) return;

    dataProcess.dataSorting(snapshot);

    log('Загрузил данные');
  }
}
