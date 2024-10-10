import 'package:flutter/material.dart';
import 'package:taskmanager/consts.dart';

Widget buttonAuth(String hint) {
  return Container(
    decoration: BoxDecoration(
      gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(44, 49, 59, 1),
            Color.fromRGBO(13, 14, 17, 1),
          ]),
      borderRadius: BorderRadius.circular(35),
    ),
    alignment: Alignment.center,
    width: widthScreen * 0.5,
    height: heigtScreen * 0.06,
    child: Align(
      child: Text(
        hint,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
  );
}
