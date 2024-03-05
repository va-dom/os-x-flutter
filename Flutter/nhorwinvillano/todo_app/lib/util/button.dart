// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";

class Button extends StatelessWidget {
  final String buttonName;
  VoidCallback onPressed;

  Button({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(buttonName),
    );
  }
}
