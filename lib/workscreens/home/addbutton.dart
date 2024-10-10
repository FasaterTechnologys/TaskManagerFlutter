import 'package:flutter/material.dart';
import 'package:taskmanager/consts.dart';

Widget addbutton() {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      Container(
        width: widthScreen * 0.18,
        height: widthScreen * 0.18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360),
            border:
                Border.all(color: const Color.fromARGB(255, 207, 207, 207))),
      ),
      Icon(
        Icons.add,
        color: const Color.fromARGB(255, 207, 207, 207),
        size: widthScreen * 0.1,
      ),
    ],
  );
}
