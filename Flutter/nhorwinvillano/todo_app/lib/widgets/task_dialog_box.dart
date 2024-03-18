// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import "package:flutter/material.dart";
import "package:todo_app/widgets/my_button.dart";
import "package:todo_app/widgets/my_dropdown.dart";

class TaskDialogBox extends StatefulWidget {
  TextEditingController description;
  int? id;
  String? category;
  final ValueChanged<String>
      onCategoryChanged; // Callback function for category change
  Function(int) onUpdate;
  VoidCallback onSave;
  VoidCallback onCancel;

  TaskDialogBox({
    super.key,
    required this.description,
    required this.category,
    required this.id,
    required this.onCategoryChanged,
    required this.onUpdate,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<TaskDialogBox> createState() => _TaskDialogBoxState();
}

class _TaskDialogBoxState extends State<TaskDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 250,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                (widget.id == null) ? 'Add Task' : "Edit Task",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // user inputs
            // Input for Task Description
            TextField(
              controller: widget.description,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Description',
              ),
            ),
            //Dropdown for Category
            MyDropdown(
                category: widget.category,
                onChanged: (value) {
                  setState(() {
                    widget.category = value;
                    widget.onCategoryChanged(
                        value); // Notify HomePage about category change
                  });
                }),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Save Button
                MyButton(
                  buttonName: 'Save',
                  onPressed: () {
                    if (widget.description.text == '' ||
                        widget.category == '-' ||
                        widget.category == null) {
                      null;
                    } else {
                      if (widget.id == null) {
                        widget.onSave();
                      } else {
                        widget.onUpdate(widget.id!);
                      }
                    }
                  },
                ),
                const SizedBox(width: 8),
                //Cancel button
                MyButton(buttonName: 'Cancel', onPressed: widget.onCancel),
              ],
            )

            // buttons
          ],
        ),
      ),
    );
  }
}
