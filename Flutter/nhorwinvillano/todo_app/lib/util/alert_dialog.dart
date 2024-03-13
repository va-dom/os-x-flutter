// ignore_for_file: must_be_immutable, prefer_const_constructors

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class MyAlertDialog extends StatelessWidget {
  final String title, content;
  VoidCallback onPressed;

  MyAlertDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        MaterialButton(
          onPressed: onPressed,
          child: Text('OK'),
        )
      ],
    );
  }
}
