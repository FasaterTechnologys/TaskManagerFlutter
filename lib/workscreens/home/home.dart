import 'package:flutter/material.dart';
import 'package:taskmanager/consts.dart';
import 'package:taskmanager/scoffaldallscreen/scaffoldallscreen.dart';
import 'package:taskmanager/workscreens/home/addbutton.dart';
import 'package:taskmanager/workscreens/home/taskinputbottomsheet.dart';
import 'package:taskmanager/workscreens/home/listview.dart';

import '../../managedata/managedata.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void refreshData() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldAllScreen(
      body: Column(
        children: [
          SizedBox(
            height: heigtScreen * 0.01,
          ),
          Expanded(
            child: listView(refreshData),
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Padding(
                padding: EdgeInsets.all(widthScreen * 0.05),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print(data);
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) =>
                              TaskInputBottomSheet(updateData: refreshData),
                        );
                      },
                      child: addbutton(),
                    ),
                    SizedBox(
                      width: widthScreen * 0.05,
                    ),
                    Text(
                      "Добавь задачу",
                      style: applowTextStyle,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
