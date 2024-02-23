import 'package:flutter/material.dart';
import 'package:my_app/models/todo.dart';
import 'package:my_app/services/todo_service.dart';
import 'package:my_app/widgets/todo_item.dart';

class TodoList extends StatefulWidget {
  final TodoService todoService;

  const TodoList({super.key, required this.todoService});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('ToDo Manager'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: widget.todoService.getTodos().map((Todo todo) {
          return TodoItem(
            todo: todo,
            onTodoChanged: widget.todoService.updateTodo,
            removeTodo: (todo) => deleteTodo(todo),//widget.todoService.deleteTodo,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onAddTodo(),
        tooltip: 'Add a ToDo',
        child: const Icon(Icons.add),
      ),
    );
  }

  void deleteTodo(Todo todo){
    widget.todoService.deleteTodo(todo);
    setState(() {});
  }

  void _onAddTodo() {
    final TextEditingController textController = TextEditingController();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a todo'),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Type your todo'),
            autofocus: true,
          ),
          actions: <Widget>[
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                widget.todoService.addTodo(textController.text);
                setState(() {}); // Refresh the list
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
