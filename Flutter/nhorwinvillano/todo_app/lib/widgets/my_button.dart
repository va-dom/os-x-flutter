// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";

class MyButton extends StatelessWidget {
  final String buttonName;
  VoidCallback onPressed;

  MyButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.lightBlue,
      child: Text(buttonName),
    );
  }
}
