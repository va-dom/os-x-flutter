// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/util/addNewTask_DialogBox.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controllers
  final TextEditingController _taskDescription = TextEditingController();
  String _category = 'Work';

  //list of To Do Task
  List toDoList = [
    ['Submit Timesheet', false, 'Work'],
    ['Buy Groceries', true, 'Personal'],
  ];

  // Checkbox was tapped fuction
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = value;
    });
  }

  // Delete Task
  void deleteClicked(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  // Save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_taskDescription.text, false, _category]);
      _taskDescription.clear();
      _category = '';
    });
    Navigator.of(context).pop();
  }

  // Create new task
  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return TaskDialogBox(
          description: _taskDescription,
          category: _category,
          index: null,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
          onUpdate: (p0) {},
          onCategoryChanged: (value) {
            setState(() {
              _category = value; // Update category in HomePage
            });
          },
        );
      },
    );
  }

  // Update exisiting task
  void updateTask(int index) {
    setState(() {
      toDoList[index] = [_taskDescription.text, toDoList[index][1], _category];
      _taskDescription.clear();
    });
    Navigator.of(context).pop();
  }

  // Edit existing task
  void editTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        // Initialize TextEditingController with the text from toDoList[index][0]
        _taskDescription.text = toDoList[index][0];
        _category = toDoList[index][2];

        return TaskDialogBox(
          description: _taskDescription,
          category: _category,
          index: index,
          onSave: () {},
          onCancel: () => Navigator.of(context).pop(),
          onUpdate: (value) {
            updateTask(value);
          },
          onCategoryChanged: (value) {
            setState(() {
              _category = value; // Update category in HomePage
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('TO DO'),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskDescription: toDoList[index][0],
              isTaskCompleted: toDoList[index][1],
              taskCategory: toDoList[index][2],
              onChanged: (value) => checkBoxChanged(value, index),
              onClickedDescription: () {
                editTask(index);
              },
              onClickedDelete: () => deleteClicked(index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
