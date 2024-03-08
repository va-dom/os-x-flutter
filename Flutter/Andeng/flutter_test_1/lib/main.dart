import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_1/screens/home.dart';

void main() {
  runApp(const ToDoListApp());
}

class ToDoListApp extends StatelessWidget{
  const ToDoListApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List App',
      home: Home(),
    );
  }
}