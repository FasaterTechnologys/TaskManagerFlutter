import 'package:flutter/material.dart';

Color field = const Color.fromARGB(255, 80, 81, 92);
Color backGroundcolor = const Color.fromARGB(255, 29, 32, 39);
Color container = const Color.fromARGB(255, 39, 43, 53);
late double widthScreen;
late double heigtScreen;

TextStyle appTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 30,
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 207, 207, 207),
  letterSpacing: 0.5,
);

TextStyle appErrorStyle = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 20,
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 131, 28, 28),
  letterSpacing: 0.5,
);

TextStyle applowTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 20,
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 207, 207, 207),
  letterSpacing: 0.5,
);

TextStyle appverylowTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 17,
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 158, 158, 158),
  letterSpacing: 0.5,
);

TextStyle titleTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 50,
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

void route(BuildContext context, String screen) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil(screen, (Route<dynamic> route) => false);
}
