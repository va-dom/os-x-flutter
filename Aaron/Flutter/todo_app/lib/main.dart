import 'package:flutter/material.dart';
import 'package:my_app/todo_list.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 128, 255)),
        useMaterial3: true,
      ),
      home: const ToDoList(title: 'ToDo Manager'),
    );
  }
}


