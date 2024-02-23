import 'package:flutter/material.dart';
import 'package:my_app/models/todo.dart';

class TodoService {
  final List<Todo> _todos = [];

  List<Todo> getTodos() {
    return _todos;
  }

  void addTodo(String name) {
    final newTodo = Todo(id: UniqueKey().toString(), name: name);
    _todos.add(newTodo);
  }

  void updateTodo(Todo todo) {
    final index = _todos.indexOf(todo);
    if (index != -1) {
      _todos[index] = todo.copyWith(completed: !todo.completed);
    }
  }

  void deleteTodo(Todo todo) {
    _todos.removeWhere((element) => element.id == todo.id);
  }
}