import 'package:firebase_database/firebase_database.dart';

class UserData {
  String date;
  bool premium;
  List<dynamic> data;
  String name;

  UserData({
    required this.date,
    required this.premium,
    required this.data,
    required this.name,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      date: json['date'],
      premium: json['premium'],
      data: json['data'],
      name: json['name'],
    );
  }
}

Future<void> loadData(FirebaseDatabase database, String user, UserData userData,
    Function callback) async {
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

      callback();
    } else {
      print("Нет данных пользователя");
    }
  } catch (e) {
    print('Ошибка при загрузке данных: $e');
  }
}
