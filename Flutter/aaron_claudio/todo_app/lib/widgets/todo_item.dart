import 'package:flutter/material.dart';
import 'package:my_app/models/todo.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  final void Function(Todo) onTodoChanged;
  final void Function(Todo) removeTodo;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onTodoChanged,
    required this.removeTodo,
  }) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool _completed = false; // Initialize based on actual value

  @override
  void initState() {
    super.initState();
    _completed = widget.todo.completed;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: _completed,
        onChanged: (value) {
          setState(() {
            _completed = value!;
            widget.onTodoChanged(widget.todo.copyWith(completed: value));
          });
        },
      ),
      title: Text(
        widget.todo.name,
        style: TextStyle(
          decoration: _completed ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: (){
          setState(() {
            widget.removeTodo(widget.todo);
          });
        }
      ),
    );
  }
}
