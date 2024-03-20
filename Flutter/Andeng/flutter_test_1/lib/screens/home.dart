import 'package:flutter/material.dart';
import 'package:flutter_test_1/constants/colors.dart';
import 'package:flutter_test_1/model/todo.dart';
import 'package:flutter_test_1/widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  String selectedCategory = "All"; 

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
               Row(
                children: [
                  Expanded(
                    child: searchBox(),
                  ),
                  Container(margin: const EdgeInsets.only(top: 40) ,
                    child: const SizedBox(height: 50, width: 20)), // Add some space between text field and dropdown
                  Expanded(
                    child: _buildCategoryFilter(selectedCategory),
                  ),
                  const SizedBox(width: 20), // Add some space between dropdown and button
                  ElevatedButton(
                    
                    onPressed: () {
                      _showAddToDoDialog(selectedCategory);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: const Size(80, 50),
                      elevation: 10,

                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    
                  ),
                ],
              ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        child: const Text(
                          'To-Do List',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todo in _foundToDo) TodoItem(
                        todo: todo,
                        onToDoChange: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                        onEditItem: _editToDoItem,
                        selectedCategory: selectedCategory,
                        
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // void _showAddToDoDialog(String selectedCategory) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Add New To-Do'),
  //         content: TextField(
  //           controller: _todoController,
  //           decoration: const InputDecoration(hintText: 'Enter your to-do'),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Cancel'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               _addToDoItem(_todoController.text, selectedCategory);
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Add'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }


  void _showAddToDoDialog(String selectedCategory) {
  TextEditingController todoController = TextEditingController();
  String selectedCategory0 = selectedCategory; // Initialize selected category with the provided value

  List<String> categories = ["All", "Category A", "Category B", "Category C"]; // Define your categories here

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add New To-Do'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: todoController,
              decoration: const InputDecoration(hintText: 'Enter your to-do'),
            ),
            DropdownButtonFormField<String>(
              value: selectedCategory0,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory0 = newValue!;
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'Category'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // _addToDoItem(todoController.text, selectedCategory0);
              // Navigator.of(context).pop();
              if (todoController.text.isNotEmpty) {
                    _addToDoItem(todoController.text, selectedCategory0);
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a to-do item.'),
                      ),
                    );
                  }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: tdBlue,
            ),
            child: const Text('Add',
            style: TextStyle(
              color: Colors.white,
            ) ,
            ),
          ),
        ],
      );
    },
  );
}


  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo, String category) {
    setState(() {
      todosList.add(
        ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          todoText: toDo,
          category: category,
        ),
      );
    });
    _todoController.clear();
  }

  // void _runFilter(String enteredKeyword) {
  //   List<ToDo> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     results = todosList;
  //   } else {
  //     results = todosList
  //         .where((item) => item.todoText!
  //             .toLowerCase()
  //             .contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //   }
  //   setState(() {
  //     _foundToDo = results;
  //   });
  // }

void _runFilter(String enteredKeyword) {
  List<ToDo> results = [];

  if (enteredKeyword.isEmpty) {
    results = todosList;
  } else {
    results = todosList
        .where((item) => item.todoText!
            .toLowerCase()
            .contains(enteredKeyword.toLowerCase()))
        .toList();
  }

  setState(() {
    _foundToDo = results;
    if (_foundToDo.isEmpty) {
      // If no results are found, show a message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No to-do items found matching your search criteria.'),
        ),
      );
    }
  });
}

  void _editToDoItem(ToDo updatedTodo) {
    setState(() {
      int index = todosList.indexWhere((item) => item.id == updatedTodo.id);
      if (index != -1) {
        todosList[index] = updatedTodo;
      }
    });
  }

  void _filterByCategory(String category) {
    List<ToDo> results = [];
    if (category == "All") {
      results = todosList;
    } else {
      results = todosList.where((item) => item.category == category).toList();
    }

  setState(() {
    _foundToDo = results;
  });
}

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 10),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }


Widget _buildCategoryFilter(String selectedCategory) {
  List<String> categories = ["All", "Category A", "Category B", "Category C"]; // Define your categories here
  return DropdownButtonFormField<String>(
    decoration: const InputDecoration(
      
      labelText: 'Category',
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
    value: selectedCategory,
    onChanged: (String? newValue) {
      setState(() {
        selectedCategory = newValue!;
        _filterByCategory(selectedCategory);
      });
    },
    items: categories.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBlue,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/girl-avatar.png'),
            ),
          )
        ],
      ),
    );
  }
}
