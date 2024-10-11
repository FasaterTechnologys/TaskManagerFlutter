import 'package:flutter/material.dart';
import 'package:taskmanager/consts.dart';
import 'package:taskmanager/managedata/managedata.dart';
import 'package:taskmanager/workscreens/home/showmodalbottomsheet.dart';

class ListCategory extends StatefulWidget {
  final Function refreshData;
  const ListCategory(this.refreshData, {super.key});

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  late List category;
  ManageData manageData = ManageData();
  @override
  Widget build(BuildContext context) {
    category = manageData.extractUniqueCategories();
    return SizedBox(
      width: widthScreen,
      height: heigtScreen * 0.08,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(heigtScreen * 0.01),
            child: GestureDetector(
              onTap: () => customshowmodalbottomsheet(
                  context, widget.refreshData,
                  category: category[index]),
              child: Container(
                decoration: BoxDecoration(
                  color: container,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(heigtScreen * 0.01),
                    child: Text(
                      category[index],
                      style: applowTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
