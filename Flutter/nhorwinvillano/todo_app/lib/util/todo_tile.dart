// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import "package:flutter/material.dart";

class ToDoTile extends StatelessWidget {
  //Function for Delete

  String taskDescription;
  String taskCategory;
  final bool isTaskCompleted;
  Function(bool?)? onChanged;
  Function() onClickedDescription;
  Function() onClickedDelete;

  ToDoTile(
      {super.key,
      required this.taskDescription,
      required this.taskCategory,
      required this.isTaskCompleted,
      required this.onChanged,
      required this.onClickedDescription,
      required this.onClickedDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: //Checkbox
            Checkbox(value: isTaskCompleted, onChanged: onChanged),
        title: GestureDetector(
          onTap: onClickedDescription,
          child: Column(
            children: [
              Text(
                taskDescription,
                style: TextStyle(
                  decoration: isTaskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                taskCategory,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        trailing: GestureDetector(
          onTap: onClickedDelete,
          child: Icon(
            Icons.delete,
            size: 20,
          ),
        ),
      ),
    );
  }
}
