import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager/consts.dart';

class ManageData {
  Future loadData() async {
    if (data.isEmpty) {
      final prefs = await SharedPreferences.getInstance();
      String? dataLoaded = prefs.getString('tasks');
      if (dataLoaded != null) {
        final List<dynamic> decodedData =
            json.decode(dataLoaded) as List<dynamic>;
        data = decodedData.map((item) => Task.fromJson(item)).toList();
      }
    }
  }

  Future saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = json.encode(data.map((task) => task.toJson()).toList());
    await prefs.setString('tasks', encodedData);
  }
}

class Task {
  String title;
  String description;
  bool isCompleted;
  String creationDate;
  String category;
  String reminderDate;
  String dueDate; // "Сегодня", "На следующей неделе", "Потом"

  Map<String, dynamic> toJson() {
    return {
      'title': title.trim(),
      'description': description.trim(),
      'isCompleted': isCompleted,
      'creationDate':
          creationDate, // Assuming creationDate is already in ISO 8601 format
      'category': category.trim(),
      'reminderDate':
          reminderDate, // Assuming reminderDate is already in ISO 8601 format
      'dueDate': dueDate,
    };
  }

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.creationDate,
    this.category = "Другое",
    this.reminderDate = "",
    this.dueDate = "",
  });

  // Метод для создания Task из JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
      creationDate: json['creationDate'],
      category: json['category'],
      reminderDate: json['reminderDate'],
      dueDate: json['dueDate'],
    );
  }
}
