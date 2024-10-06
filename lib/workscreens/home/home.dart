import 'package:flutter/material.dart';
import 'package:taskmanager/global.dart';
import 'package:taskmanager/scaffoldallscreen.dart';
import 'package:taskmanager/workscreens/home/addbutton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldAllScreen(
      body: Column(
        children: [
          SizedBox(
            height: heigtScreen * 0.01,
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
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => const TaskInputBottomSheet(),
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

class TaskInputBottomSheet extends StatefulWidget {
  const TaskInputBottomSheet({super.key});

  @override
  _TaskInputBottomSheetState createState() => _TaskInputBottomSheetState();
}

class _TaskInputBottomSheetState extends State<TaskInputBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGroundcolor,
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: heigtScreen * 0.8,
        child: Scaffold(
          key: _formKey,
          body: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _taskController,
                  decoration: const InputDecoration(
                    hintText: 'Введите задачу',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите задачу';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Сохраняем введенную задачу
                      String newTask = _taskController.text;
                      // Здесь обработайте новую задачу, например, добавьте ее в список
                      print('Новая задача: $newTask');

                      // Закрываем окно
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Добавить'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
