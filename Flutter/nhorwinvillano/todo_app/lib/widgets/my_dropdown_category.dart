// ignore_for_file: must_be_immutable, prefer_const_constructors
import "package:flutter/material.dart";

class MyCategory extends StatefulWidget {
  String? category;
  final ValueChanged<String> onChanged; // Callback function for category change

  MyCategory({super.key, this.category, required this.onChanged});

  @override
  State<MyCategory> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: DropdownButton(
        value: widget.category,
        padding: EdgeInsets.only(left: 15, right: 15),
        underline: Container(height: 0),
        borderRadius: BorderRadius.circular(20),
        isExpanded: true,
        hint: Text('Category'),
        dropdownColor: Colors.white,
        focusColor: Colors.white,
        items: <String>['-', 'Work', 'Personal', 'Health', 'Finance', 'Travel']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            widget.category = value!;
            widget.onChanged(value); // Notify HomePage about category change
          });
        },
      ),
    );
  }
}
