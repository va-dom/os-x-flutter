import 'package:flutter/cupertino.dart';

import 'dbHelper.dart';

class Task {
  final int? id;
  final int? categoryId;
  final String taskTitle;
  final bool isCompleted;
  final bool isBookmarked;
  final int? createdOn;
  final int? updatedOn;

  Task({
    this.id,
    this.categoryId,
    required this.taskTitle,
    required this.isCompleted,
    required this.isBookmarked,
    this.createdOn,
    this.updatedOn
  });

  //Method to convert 'Task' to a Map of String, dynamic
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskTitle': taskTitle,
      'categoryId': categoryId,
      'isCompleted': isCompleted ? 1 : 0,
      'isFavorite': isBookmarked ? 1 : 0,
      'createdOn': createdOn,
      'updatedOn': updatedOn,
    };
  }

  //Factory constructor to convert Map<String,dynamic> to Task
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      taskTitle: map['taskTitle'],
      categoryId: map['categoryId'],
      isCompleted: map['isCompleted'] == 1,
      isBookmarked: map['isFavorite'] == 1,
      createdOn: map['createdOn'],
      updatedOn: map['updatedOn'],
    );
  }

}

class TaskProvider extends ChangeNotifier{
  late DatabaseHelper _dbHelper;

  TaskProvider() {
    _dbHelper = DatabaseHelper();
  }

  //For adding new task
  Future<void> addTask(Task task) async {
    await DatabaseHelper.instance.insertTask(task);
    notifyListeners();
  }

  //For getting tasks by category
  Future<List<Task>> myTasks(int categoryId) async {
    return await DatabaseHelper.instance.getTasksByCategory(categoryId);
  }

  //For updating task
  Future<void> updateTask(Task task) async {
    await DatabaseHelper.instance.updateTask(task);
    notifyListeners();
  }

  //For updating IsComplete of task
  Future<void> updateTaskIsComplete(int id, bool isComplete) async {
    await DatabaseHelper.instance.updateTaskIsComplete(id, isComplete);
    notifyListeners();
  }

  //For updating IsFavorite/IsBookmark of Task
  Future<void> updateTaskIsBookmark(int id, bool isBookmark) async {
    await DatabaseHelper.instance.updateTaskIsBookmark(id, isBookmark);
    notifyListeners();
  }

  //For deleting task
  Future<void> deleteTask(int id) async {
    await DatabaseHelper.instance.deleteTask(id);
    notifyListeners();
  }

}