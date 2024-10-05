import 'package:flutter/material.dart';
import 'package:taskmanager/global.dart';

Widget buttonHome(
    BuildContext context, String screen, IconData icon, String text) {
  final navigator = Navigator.of(context);
  double pading = widthScreen * 0.033;
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.only(top: pading, bottom: pading),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: pading),
            child: Icon(icon, size: widthScreen * 0.07, color: Colors.white),
          ),
          Text(text, style: appTextStyle)
        ],
      ),
    ),
    onTap: () => navigator.pushNamedAndRemoveUntil(
        screen, (Route<dynamic> route) => false),
  );
}
