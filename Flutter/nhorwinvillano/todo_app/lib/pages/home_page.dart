// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/task_DialogBox.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  void loadData({String? keyword}) {
    try {
      if (keyword != null && keyword.isNotEmpty) {
        setState(() {
          db.toDoList = _myBox
              .get("TODOLIST", defaultValue: [])
              .where((task) => task[0]
                  .toString()
                  .toLowerCase()
                  .contains(keyword.toLowerCase()))
              .toList();
        });
      } else {
        setState(() {
          db.toDoList = _myBox.get("TODOLIST", defaultValue: []);
        });
      }
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  @override
  void initState() {
    // if this is the 1st time ever opening the app, then create defaukt data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already existing data
      loadData();
    }

    super.initState();
  }

  //text controllers
  final TextEditingController _searchKeyword = TextEditingController();
  final TextEditingController _taskDescription = TextEditingController();
  String _category = 'Work';

  // Checkbox was tapped fuction
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = value;
    });
    //db.updateDatabase();
  }

  // Delete Task
  void deleteClicked(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    //db.updateDatabase();
  }

  // Save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_taskDescription.text, false, _category]);
      _taskDescription.clear();
    });
    Navigator.of(context).pop();
    //db.updateDatabase();
  }

  // Create new task
  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return TaskDialogBox(
          description: _taskDescription,
          category: 'Work',
          index: null,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
          onUpdate: (value) {},
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
      db.toDoList[index] = [
        _taskDescription.text,
        db.toDoList[index][1],
        _category
      ];
      _taskDescription.clear();
      //_searchKeyword.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // Edit existing task
  void editTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        // Initialize TextEditingController with the text from toDoList[index][0]
        _taskDescription.text = db.toDoList[index][0];
        _category = db.toDoList[index][2];

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchKeyword,
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (value) {
                loadData(keyword: _searchKeyword.text);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskDescription: db.toDoList[index][0],
                  isTaskCompleted: db.toDoList[index][1],
                  taskCategory: db.toDoList[index][2],
                  onChanged: (value) => checkBoxChanged(value, index),
                  onClickedDescription: () {
                    editTask(index);
                  },
                  onClickedDelete: () => deleteClicked(index),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
