
import 'package:flutter/material.dart';
import 'package:my_app/todo.dart';

class TodoItem extends StatelessWidget{
  
  TodoItem({required this.todo, required this.onTodoChanged, required this.removeTodo}) : super (key: ObjectKey(todo));
  
  final Todo todo;
  final void Function(Todo todo) onTodoChanged;
  final void Function(Todo todo) removeTodo;

  TextStyle? _getTextStyle(bool checked){
    if(!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        //onTodoChanged(todo);
      },
      leading: Checkbox(
        onChanged: (value){
          onTodoChanged(todo);
        },
        checkColor: Colors.greenAccent,
        activeColor: Colors.red,
        value: todo.completed,
      ),
      title: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              todo.name,
              style: _getTextStyle(todo.completed),
            ),
          ),
          IconButton(
            onPressed: (){
              removeTodo(todo);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            alignment: Alignment.centerRight,
          )
        ],
      ),
    );
  }
}