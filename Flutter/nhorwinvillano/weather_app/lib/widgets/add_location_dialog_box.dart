// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import "package:flutter/material.dart";

class AddLocationDialogBox extends StatefulWidget {
  TextEditingController location;
  VoidCallback onSave;
  VoidCallback onCancel;

  AddLocationDialogBox({
    super.key,
    required this.location,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<AddLocationDialogBox> createState() => _TaskDialogBoxState();
}

class _TaskDialogBoxState extends State<AddLocationDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Add Location')),
      content: TextFormField(
        controller: widget.location,
        decoration: InputDecoration(
          labelText: 'City name',
        ),
      ),
      actions: [
        MaterialButton(onPressed: widget.onSave, child: Text('Save')),
        MaterialButton(onPressed: widget.onCancel, child: Text('Cancel'))
      ],
    );
  }
}
