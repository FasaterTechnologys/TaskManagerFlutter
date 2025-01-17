import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskmanager/managedata/managedata.dart';
import 'package:taskmanager/manageuser/userfirebaseload.dart';

Color field = const Color.fromARGB(255, 80, 81, 92);
Color backGroundcolor = const Color.fromARGB(255, 29, 32, 39);
Color container = const Color.fromARGB(255, 39, 43, 53);
UserData userDecode =
    UserData(date: '', premium: false, data: [], name: '', uid: "");
late double widthScreen;
late double heigtScreen;

DateTime getCurrentDateTime() {
  return DateTime.now();
}

String getFormattedDateTime() {
  DateTime now = getCurrentDateTime();
  String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
  return formattedDate;
}

List<Task> data = [];

TextStyle appTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 25,
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 207, 207, 207),
  letterSpacing: 0.5,
);

TextStyle appErrorStyle = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 15,
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 131, 28, 28),
  letterSpacing: 0.5,
);

TextStyle applowTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 17,
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 207, 207, 207),
  letterSpacing: 0.5,
);

TextStyle appverylowTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 158, 158, 158),
  letterSpacing: 0.5,
);
TextStyle appverylowthinTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 14,
  color: Color.fromARGB(255, 158, 158, 158),
  letterSpacing: 0.5,
);

TextStyle titleTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 40,
  fontWeight: FontWeight.w600,
  color: Color.fromARGB(255, 207, 207, 207),
  letterSpacing: 0.5,
);

TextStyle buttonTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Colors.white,
  letterSpacing: 0.5,
);
