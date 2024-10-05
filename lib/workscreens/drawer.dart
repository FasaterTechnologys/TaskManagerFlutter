import 'package:flutter/material.dart';
import 'package:taskmanager/global.dart';
import 'package:taskmanager/workscreens/scripts/buttonhome.dart';

Widget dawer(BuildContext context) {
  return Container(
    color: backGroundcolor,
    child: Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: heigtScreen * 0.06),
            child: Container(
              margin: EdgeInsets.only(
                left: widthScreen * 0.07,
                right: widthScreen * 0.07,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.settings,
                      size: widthScreen * 0.07, color: Colors.white),
                  Icon(Icons.cloud_off,
                      size: widthScreen * 0.07, color: Colors.white)
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: widthScreen * 0.07, top: widthScreen * 0.05),
            child: Column(
              children: [
                buttonHome(context, "/home", Icons.menu_book, "Главный экран"),
                buttonHome(context, "/home", Icons.task, "Дневник задач"),
                buttonHome(context, "/profile", Icons.person, "Профиль"),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
