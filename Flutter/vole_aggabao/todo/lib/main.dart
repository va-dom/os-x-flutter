import 'package:flutter/material.dart';
import 'package:todo/src/data/db/category_db.dart';
import 'package:todo/src/data/db/task_db.dart';
import 'package:todo/src/screens/home.dart';

void main() {
  runApp(const MyApp());
  TaskDb().generateSampleData();
  CategoryDb().generateSampleData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        // scaffoldBackgroundColor: Colors.grey[800],
      ),
      home: const MyHomePage(),
    );
  }
}
