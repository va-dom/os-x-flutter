import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/dbHelper.dart';
import '../constants/colors.dart';
import '../models/categories.dart';
import '../models/tasks.dart';

class TaskDialog extends StatefulWidget {
  final int? id;
  final TextEditingController titleController;
  bool isCompleted;
  bool isBookmarked;
  final String? initialTitle;
  final int? initialCategoryId;
  final bool? initialIsCompleted;
  final bool? initialIsBookmarked;

  TaskDialog(
      {this.id,
      required this.titleController,
      required this.isCompleted,
      required this.isBookmarked,
      this.initialTitle,
      this.initialCategoryId,
      this.initialIsCompleted,
      this.initialIsBookmarked});

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  late int _selectedCategoryId;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _selectedCategoryId = widget.initialCategoryId ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final taskProvider = Provider.of<TaskProvider>(context);

    return AlertDialog(
      backgroundColor: myOrangeAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      titlePadding: EdgeInsets.zero,
      title: Container(
          decoration: BoxDecoration(
              color: myOrange,
              borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
                widget.initialTitle == null ? 'Add New Task' : 'Update Task',
                style: TextStyle(color: myFontColor)),
          )),
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                    controller: widget.titleController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        labelText: 'Task Title',
                        labelStyle: TextStyle(color: myFontColor)),
                    maxLength: 25,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Task title is required.';
                      }
                      return null;
                    }),
                SizedBox(height: 15),
                FutureBuilder<List<Categories>>(
                  future: categoryProvider.myCategories,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final categories = snapshot.data ?? [];
                      final validCategories = categories
                          .where((category) =>
                              category.id != null && category.id! > 0)
                          .toList();
                      if (validCategories.isEmpty) {
                        return Text('No categories');
                      }
                      return Visibility(
                        visible: widget.initialTitle != null,
                        child: DropdownButtonFormField<int>(
                          value: _selectedCategoryId,
                          onChanged: (value) {
                            setState(() {
                              _selectedCategoryId = value ?? 0;
                            });
                          },
                          items: validCategories
                              .map<DropdownMenuItem<int>>((category) {
                            return DropdownMenuItem<int>(
                                value: category.id!,
                                child: Text(category.categoryLabel,
                                    style: TextStyle(color: Colors.black)));
                          }).toList(),
                          decoration: InputDecoration(
                              labelText: 'Category',
                              labelStyle: TextStyle(color: myFontColor)),
                          validator: (value) {
                            if (value == null || value == 0) {
                              return 'Category is required';
                            }
                            return null;
                          },
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 15),
                Row(children: [
                  Text(
                    'Mark as Complete: ',
                    style: TextStyle(color: myFontColor),
                  ),
                  Checkbox(
                    value: widget.isCompleted,
                    onChanged: (value) {
                      setState(() {
                        widget.isCompleted = value ?? false;
                      });
                    },
                  )
                ]),
                SizedBox(height: 15),
                Row(children: [
                  Text('Mark as Bookmarked: ',
                      style: TextStyle(color: myFontColor)),
                  Checkbox(
                    value: widget.isBookmarked,
                    onChanged: (value) {
                      setState(() {
                        widget.isBookmarked = value ?? false;
                      });
                    },
                  )
                ])
              ],
            )),
      ),
      actionsPadding: EdgeInsets.zero,
      actions: <Widget>[
        Container(
            decoration: BoxDecoration(
              color: myOrange,
              //border: Border.all(color: myOrange, style: BorderStyle.solid, width: 2),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); // Close the dialog without adding/updating a task
                    },
                    child: Text('Cancel',
                        style: TextStyle(color: myFontColor, fontSize: 18)),
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
                            if (_formKey.currentState!.validate()) {
                              final newTaskTitle = widget.titleController.text;
                              if (widget.initialTitle == null) {
                                final task = Task(
                                    taskTitle: newTaskTitle,
                                    categoryId: _selectedCategoryId,
                                    isCompleted: widget.isCompleted,
                                    isBookmarked: widget.isBookmarked);

                                taskProvider.addTask(task);
                              } else {
                                final newTask = Task(
                                    id: widget.id,
                                    taskTitle: newTaskTitle,
                                    categoryId: _selectedCategoryId,
                                    isCompleted: widget.isCompleted,
                                    isBookmarked: widget.isBookmarked);

                                taskProvider.updateTask(newTask);
                              }
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            widget.initialTitle == null ? 'Add' : 'Update',
                            style: TextStyle(color: myFontColor, fontSize: 18),
                          ),
                        )))
              ],
            ))
      ],
    );
  }
}
