import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ToDoDatabase {
  List toDoList = [];

  //referece our box
  final _myBox = Hive.box('myBox');

  // Run this method if this is the first time opening the app
  void createInitialData() {
    try {
      toDoList = [
        ['TaskName1', false, 'Work'],
        ['TaskName2', false, 'Personal'],
      ];
      _myBox.put("TODOLIST", toDoList);
    } catch (e) {
      print('Error creating initial data: $e');
    }
  }

  // Update the database
  void updateDatabase() {
    try {
      _myBox.put("TODOLIST", toDoList);
    } catch (e) {
      print('Error updating database: $e');
    }
  }
}
