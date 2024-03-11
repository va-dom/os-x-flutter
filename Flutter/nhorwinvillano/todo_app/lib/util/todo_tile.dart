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
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Checkbox
            Checkbox(value: isTaskCompleted, onChanged: onChanged),
            // Task name
            GestureDetector(
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
            GestureDetector(
              onTap: onClickedDelete,
              child: Icon(
                Icons.delete,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
