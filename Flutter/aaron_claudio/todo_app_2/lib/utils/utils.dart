import 'package:flutter/material.dart';
import 'package:todo_app_2/models/category.dart';
import 'package:todo_app_2/models/task.dart';
import 'package:todo_app_2/widgets/add_task_dialog.dart';

Future<Task?> openAddTaskDialog({
  required BuildContext context,
  Task? task,
  required List<Category> categories,
  required Function(String) onAddCategory,
}){
  return showDialog<Task?>(
    barrierDismissible: false,
    context: context,
    builder: (context){
      return AddTaskDialog(
        task: task,
        categories: categories,
        onAddCategory: onAddCategory,
      );
    }
  );
}