import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_1/screens/home.dart';

void main() {
  runApp(const ToDoListApp());
}

class ToDoListApp extends StatelessWidget{
  const ToDoListApp({super.key});

  @override 
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List App',
      home: Home(),
    );
  }
}

// Task 1	As a user, I want to be able to create a new to-do list item, so that I can keep track of tasks I need to complete.				
// Task 2	As a user, I want to be able to mark a to-do list item as complete, so that I can track my progress.				
// Task 3	As a user, I want to be able to edit a to-do list item, so that I can update the task details if needed.				
// Task 4	As a user, I want to be able to delete a to-do list item, so that I can remove tasks that are no longer relevant.				
// Task 5	As a user, I want to be able to organize my to-do list items into different categories or projects, so that I can manage multiple tasks more efficiently.				
// Task 6	As a user, I want to be able to search and filter my to-do list items, so that I can quickly find specific tasks or information.				