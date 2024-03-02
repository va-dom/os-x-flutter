// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('TO DO'),
          elevation: 0,
        ),
        body: ListView(
          children: [
            ToDoTile(
              taskName: 'Todo 1',
              isTaskCompleted: true,
              onChanged: (p0) {},
            ),
            ToDoTile(
              taskName: 'Todo 2',
              isTaskCompleted: false,
              onChanged: (p0) {},
            ),
          ],
        ));
  }
}
