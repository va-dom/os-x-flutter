import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/colors.dart';
import '../models/categories.dart';
import '../models/tasks.dart';
import 'taskDialog.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final Map<String, dynamic> task;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    var id = task['id'];
    final bool isCompleted = task['isCompleted'] == 1;
    final bool isBookmarked = task['isFavorite'] == 1;
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: myDarkOrange, width: 2),
            borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(bottom: 10),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ChangeNotifierProvider<CategoryProvider>(
                          create: (context) => CategoryProvider(),
                          child: TaskDialog(
                            id: task['id'],
                            titleController:
                                TextEditingController(text: task['taskTitle']),
                            isCompleted: task['isCompleted'] == 1,
                            initialTitle: task['taskTitle'],
                            initialCategoryId: task['categoryId'],
                            isBookmarked: task['isFavorite'] == 1,
                          ));
                    });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              tileColor: isBookmarked ? myOrange : myOrange.withOpacity(.30),
              leading: GestureDetector(
                onTap: () async {
                  taskProvider.updateTaskIsComplete(
                      task['id'], !(task['isCompleted'] == 1));
                  print('Icon tapped');
                },
                child: Icon(
                  isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                  color: myDarkOrange,
                  size: 30,
                ),
              ),
              title: SizedBox(
                width: 110,
                child: Text(task['taskTitle']!,
                    style: TextStyle(
                        fontSize: 20,
                        color: isCompleted
                            ? myFontColor.withOpacity(.50)
                            : myFontColor,
                        decoration:
                            isCompleted ? TextDecoration.lineThrough : null)),
              ),
              trailing: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: myOrangeAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          titlePadding: EdgeInsets.all(0),
                          title: Container(
                              decoration: BoxDecoration(
                                  color: myOrange,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(5))),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('Confirm Delete',
                                    style: TextStyle(color: myFontColor)),
                              )),
                          contentPadding: EdgeInsets.zero,
                          content: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: myOrange,
                                        style: BorderStyle.solid,
                                        width: 2),
                                    right: BorderSide(
                                        color: myOrange,
                                        style: BorderStyle.solid,
                                        width: 2))),
                            child: Text(
                                'Are you sure you want to delete this task?',
                                style: TextStyle(color: Colors.black)),
                          ),
                          actionsPadding: EdgeInsets.zero,
                          actions: <Widget>[
                            Container(
                                decoration: BoxDecoration(
                                  color: myOrange,
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(5)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog without adding/updating a task
                                        },
                                        child: Text('No',
                                            style: TextStyle(
                                                color: myFontColor,
                                                fontSize: 18)),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                                  color: myOrangeAccent,
                                                  style: BorderStyle.solid,
                                                  width: 1))),
                                      child: TextButton(
                                        onPressed: () async {
                                          if (id != null) {
                                            if (id != null) {
                                              taskProvider.deleteTask(id!);
                                            }
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: Text('Yes',
                                            style: TextStyle(
                                                color: myFontColor,
                                                fontSize: 18)),
                                      ),
                                    ))
                                  ],
                                ))
                          ],
                        );
                      });
                },
                child: Icon(Icons.delete_rounded, color: myFontColor, size: 28),
              ),
            ),
            Positioned(
              top: -9,
              right: 35,
              child: GestureDetector(
                onTap: () async {
                  taskProvider.updateTaskIsBookmark(
                      task['id'], !(task['isFavorite'] == 1));
                  print('${task['isFavorite']}');
                },
                child: Icon(
                  isBookmarked
                      ? Icons.bookmark_sharp
                      : Icons.bookmark_outline_sharp,
                  color: myDarkOrange,
                  size: 40,
                ),
              ),
            )
          ],
        ));
  }
}
