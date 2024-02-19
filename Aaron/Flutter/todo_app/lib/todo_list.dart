import 'package:flutter/material.dart';
import 'package:my_app/todo.dart';
import 'package:my_app/todo_items.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key, required this.title});

  

  final String title;

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final List<Todo> _todos = <Todo>[];
  final TextEditingController _textFieldController = TextEditingController();

  //to add todo item to the list
  void _addTodoItem(String name){
    setState(() {
      _todos.add(Todo(name: name, completed: false));
    });
    _textFieldController.clear();
  }

  //to change the status of todo item
  void _handleTodoChange(Todo todo){
    setState(() {
      todo.completed = !todo.completed;
    });
  }

  void _deleteTodo(Todo todo){
    setState(() {
      _todos.removeWhere((element) => element.name == todo.name);
    });
  }

  //floating button action
  Future<void> _displayDialog() async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        //popup dialog
        return AlertDialog(
          title: const Text("Add a todo"),
          //input text
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: "Type your todo"),
            autofocus: true,
          ),
          //Buttons: Cancell and Add
          actions: <Widget>[
            //Cancel
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: const Text("Cancel")
            ),
            //Add
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: (){
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              }, child: const Text("Add")
              ),
          ],
        );
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      //todo items
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: _todos.map((Todo todo){
          return TodoItem(
            todo: todo,
            onTodoChanged: _handleTodoChange,
            removeTodo: _deleteTodo,
            );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(),
        tooltip: 'Add a ToDo',
        child: const Icon(Icons.add),
      ),
    );
  }
}

