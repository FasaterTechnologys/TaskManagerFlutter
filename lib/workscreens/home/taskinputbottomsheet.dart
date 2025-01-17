import 'package:flutter/material.dart';
import 'package:taskmanager/consts.dart';
import 'package:taskmanager/managedata/managedata.dart';

class TaskInputBottomSheet extends StatefulWidget {
  final Function updateData;
  final int? index;
  final String? category;
  const TaskInputBottomSheet(
      {required this.updateData, this.index, this.category, super.key});

  @override
  TaskInputBottomSheetState createState() => TaskInputBottomSheetState();
}

class TaskInputBottomSheetState extends State<TaskInputBottomSheet> {
  final _taskController = TextEditingController();
  final _lowtaskController = TextEditingController();
  final _categoryController = TextEditingController(text: "Другое");
  List<Widget> lowTask = [];

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      _populateControllersFromTask(widget.index!);
    } else if (widget.category != null) {
      _categoryController.text = widget.category!;
    }
  }

  void _populateControllersFromTask(int index) {
    if (index >= 0 && index < data.length) {
      _taskController.text = data[index].title;
      _lowtaskController.text = data[index].description;
      _categoryController.text = data[index].category;
    }
  }

  @override
  void dispose() {
    _taskController.dispose();
    _lowtaskController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ManageData manageData = ManageData();
    return Container(
      height: heigtScreen * 0.9,
      decoration: BoxDecoration(
        color: backGroundcolor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                autofocus: true,
                controller: _taskController,
                style: applowTextStyle,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Введите название задачи',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 207, 207, 207),
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textInputAction: TextInputAction.newline,
                style: appverylowthinTextStyle,
                autofocus: true,
                controller: _categoryController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Введите категорию',
                  hintStyle: appverylowthinTextStyle,
                  labelStyle: appverylowthinTextStyle,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: heigtScreen * 0.016),
                    child: const Icon(
                      Icons.arrow_right,
                      color: Color.fromARGB(255, 207, 207, 207),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textInputAction: TextInputAction.newline,
                      style: appverylowthinTextStyle,
                      autofocus: true,
                      controller: _lowtaskController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Введите задачу',
                        hintStyle: appverylowthinTextStyle,
                        labelStyle: appverylowthinTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heigtScreen * 0.01,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    ManageData saveData = ManageData();

                    if (widget.index == null) {
                      manageData.addTask(
                        _taskController.text.trim(),
                        _lowtaskController.text.trim(),
                        getFormattedDateTime().toString(),
                        _categoryController.text == ""
                            ? "Другое"
                            : _categoryController.text,
                      );
                    } else {
                      manageData.updateTask(
                          widget.index ?? -1,
                          _taskController.text,
                          _lowtaskController.text,
                          _categoryController.text);
                    }
                    saveData.saveData();
                    widget.updateData();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: widthScreen * 0.3,
                    height: heigtScreen * 0.05,
                    decoration: BoxDecoration(
                        color: container,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(300))),
                    child: Center(
                        child: Text(
                      "Добавить",
                      style: applowTextStyle,
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EditData {}
