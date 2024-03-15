// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/alert_dialog.dart';
import 'package:todo_app/util/my_dropdown.dart';
import 'package:todo_app/util/task_dialog_box.dart';
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

  //text controllers
  final TextEditingController _searchKeyword = TextEditingController();
  final TextEditingController _taskDescription = TextEditingController();
  String? _filterCategory = '-';
  String? _category = '-';

// Load data function
  void loadData({String? keyword, String? category}) {
    try {
      if ((keyword != null && keyword.isNotEmpty) ||
          (category != null && category.isNotEmpty)) {
        setState(() {
          filteredList = _myBox
              .get("TODOLIST", defaultValue: [])
              .where((task) =>
                  (keyword == null ||
                      keyword.isEmpty ||
                      task[1]
                          .toString()
                          .toLowerCase()
                          .contains(keyword.toLowerCase())) &&
                  (category == '-' ||
                      category!.isEmpty ||
                      task[3].toString().toLowerCase() ==
                          category.toLowerCase()))
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

  // showDialog function
  void showAlert(String title, content) {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertDialog(
            title: title,
            content: content,
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  // Checkbox was tapped fuction
  void checkBoxChanged(bool? value, int id) {
    int index = findIndexByID(db.toDoList, id);
    setState(() {
      db.toDoList[index][2] = value;
      //filteredList[index][2] = value;
    });
    showAlert("Success", "Task status changed successfully");
    loadData(keyword: _searchKeyword.text, category: _filterCategory);
    db.updateDatabase();
  }

  // Delete Task
  void deleteClicked(int id) {
    int index = findIndexByID(db.toDoList, id);
    setState(() {
      db.toDoList.removeAt(index);
      //filteredList.removeAt(index);
    });
    loadData(keyword: _searchKeyword.text, category: _filterCategory);
    db.updateDatabase();
    showAlert("Success", "Task deleted successfully");
  }

  // Save new task
  void saveNewTask() {
    // Get the largest value in the list
    int idNumber =
        db.toDoList.fold(0, (max, item) => item[0] > max ? item[0] : max) + 1;

    setState(() {
      db.toDoList.add([idNumber, _taskDescription.text, false, _category]);
      _taskDescription.clear();
    });
    Navigator.of(context).pop();
    showAlert("Success", "Task added successfully");
    db.updateDatabase();
    loadData(keyword: _searchKeyword.text, category: _filterCategory);
  }

  // Create new task
  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return TaskDialogBox(
          description: _taskDescription,
          category: null,
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
    loadData(keyword: _searchKeyword.text, category: _filterCategory);
    showAlert("Success", "Task updated successfully");
  }

  // Edit existing task
  void editTask(int id) {
    int index = findIndexByID(db.toDoList, id);
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

// Function to build ListView
  Widget _buildListView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        child: ListView.builder(
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskDescription: filteredList[index][1],
              isTaskCompleted: filteredList[index][2],
              taskCategory: filteredList[index][3],
              onChanged: (value) =>
                  checkBoxChanged(value, filteredList[index][0]),
              onClickedDescription: () => editTask(filteredList[index][0]),
              onClickedDelete: () => deleteClicked(filteredList[index][0]),
            );
          },
        ),
      ),
    );
  }

// Function to build empty list indicator with image
  Widget _buildEmptyListIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'image_empty_list.gif',
              width: 500,
              height: 300,
              // Optionally, you can add other properties like fit, alignment, etc.
            ),
            SizedBox(height: 20), // Adjust spacing as needed
            Text(
              'Add a task to get started',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF5),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'TO DO APP',
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ],
        ),
        elevation: 20,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Textfield for Search Tasks
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: TextField(
              controller: _searchKeyword,
              decoration: InputDecoration(
                hintText: 'Search tasks...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (value) {
                loadData(
                    keyword: _searchKeyword.text, category: _filterCategory);
              },
            ),
          ),
          // Dropdown for filter Category
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyDropdown(
              category: _filterCategory,
              onChanged: (value) {
                setState(() {
                  _filterCategory = value; // Update category in HomePage
                });
                loadData(
                    keyword: _searchKeyword.text, category: _filterCategory);
              },
            ),
          ),
          // ToDo Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'All ToDos',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Listview builder
          Expanded(
            child: filteredList.isNotEmpty
                ? _buildListView()
                : _buildEmptyListIndicator(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        backgroundColor: Colors.lightBlue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
