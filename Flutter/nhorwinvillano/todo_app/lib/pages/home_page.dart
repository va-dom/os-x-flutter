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
  List filteredList = [];

  void loadData({String? keyword}) {
    try {
      if (keyword != null && keyword.isNotEmpty) {
        setState(() {
          filteredList = _myBox
              .get("TODOLIST", defaultValue: [])
              .where((task) => task[1]
                  .toString()
                  .toLowerCase()
                  .contains(keyword.toLowerCase()))
              .toList();
        });
        print('with filter');
        print('F: $filteredList');
        print('DB: ${db.toDoList}');
      } else {
        setState(() {
          db.toDoList = _myBox.get("TODOLIST", defaultValue: []);
          filteredList = _myBox.get("TODOLIST", defaultValue: []);
        });
        print('without filter');
        print('F: $filteredList');
        print('DB: ${db.toDoList}');
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
      loadData();
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
      //db.toDoList[index][2] = value;
      filteredList[index][2] = value;
    });
    //db.updateDatabase();
  }

  // Delete Task
  void deleteClicked(int index) {
    setState(() {
      //db.toDoList.removeAt(index);
      filteredList.removeAt(index);
    });
    db.updateDatabase();
  }

  // Save new task
  void saveNewTask() {
    // Get the largest value in the list
    int idNumber =
        db.toDoList.fold(0, (max, item) => item[0] > max ? item[0] : max) + 1;

    setState(() {
      //db.toDoList.add([_taskDescription.text, false, _category]);
      //filteredList.add([idNumber, _taskDescription.text, false, _category]);
      db.toDoList.add([idNumber, _taskDescription.text, false, _category]);
      _taskDescription.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
    loadData(keyword: _searchKeyword.text);
    print('After save');
    print('F: $filteredList');
    print('DB: ${db.toDoList}');
  }

  // Create new task
  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return TaskDialogBox(
          description: _taskDescription,
          category: 'Work',
          id: null,
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
        db.toDoList[index][0],
        _taskDescription.text,
        db.toDoList[index][2],
        _category
      ];
      _taskDescription.clear();
      //_searchKeyword.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
    loadData(keyword: _searchKeyword.text);
    print('After update');
    print('F: $filteredList');
    print('DB: ${db.toDoList}');
  }

  // Edit existing task
  void editTask(int id) {
    int index = findIndexByID(db.toDoList, id);
    print(index ?? 0);
    showDialog(
      context: context,
      builder: (context) {
        // Initialize TextEditingController with the text from toDoList[index][0]
        _taskDescription.text = db.toDoList[index][1];
        _category = db.toDoList[index][3];

        return TaskDialogBox(
          description: _taskDescription,
          category: _category,
          id: index,
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

// find index by ID
  int findIndexByID(List toDoList, int id) {
    for (var entry in toDoList.asMap().entries) {
      if (entry.value[0] == id) {
        return entry.key;
      }
    }
    return -1; // ID not found
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
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskDescription: filteredList[index][1],
                  isTaskCompleted: filteredList[index][2],
                  taskCategory: filteredList[index][3],
                  onChanged: (value) => checkBoxChanged(value, index),
                  onClickedDescription: () {
                    editTask(filteredList[index][0]);
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
