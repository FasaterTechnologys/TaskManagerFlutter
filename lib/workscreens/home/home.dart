import 'package:flutter/material.dart';
import 'package:taskmanager/consts.dart';
import 'package:taskmanager/managedata/managedata.dart';
import 'package:taskmanager/scoffaldallscreen/scaffoldallscreen.dart';
import 'package:taskmanager/workscreens/home/addbutton.dart';
import 'package:taskmanager/workscreens/home/listcategory.dart';
import 'package:taskmanager/workscreens/home/showmodalbottomsheet.dart';
import 'package:taskmanager/workscreens/home/listview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ManageData manageData = ManageData();
  late List category;

  void refreshData() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldAllScreen(
      body: FutureBuilder(
        future: manageData.loadData(),
        builder: (context, snapshot) {
          return Column(
            children: [
              SizedBox(
                height: heigtScreen * 0.01,
              ),
              ListCategory(refreshData),
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
                            customshowmodalbottomsheet(context, refreshData);
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
          );
        },
      ),
    );
  }
}
