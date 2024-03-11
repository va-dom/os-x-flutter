// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import "package:flutter/material.dart";
import "package:todo_app/util/button.dart";

class TaskDialogBox extends StatefulWidget {
  TextEditingController description;
  int? index;
  String category;
  final ValueChanged<String>
      onCategoryChanged; // Callback function for category change
  Function(int) onUpdate;
  VoidCallback onSave;
  VoidCallback onCancel;

  TaskDialogBox({
    super.key,
    required this.description,
    required this.category,
    required this.index,
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
        height: 400,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // user inputs
            // Input for Task Description
            TextField(
              controller: widget.description,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Description',
              ),
            ),
            //Dropdown for Category
            Container(
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(4)),
              padding: EdgeInsets.only(left: 10),
              child: DropdownButton(
                value: widget.category,
                isExpanded: true,
                hint: Text('Category'),
                dropdownColor: Colors.white,
                focusColor: Colors.white,
                borderRadius: BorderRadius.circular(4),
                items: <String>[
                  'Work',
                  'Personal',
                  'Health',
                  'Finance',
                  'Travel'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    widget.category = value!;
                    widget.onCategoryChanged(
                        value); // Notify HomePage about category change
                  });
                },
              ),
            ),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Save Button
                Button(
                  buttonName: 'Save',
                  onPressed: () {
                    if (widget.index == null) {
                      widget.onSave();
                    } else {
                      widget.onUpdate(widget.index!);
                    }
                  },
                ),
                const SizedBox(width: 8),

                //Cancel button
                Button(buttonName: 'Cancel', onPressed: widget.onCancel),
              ],
            )

            // buttons
          ],
        ),
      ),
    );
  }
}
