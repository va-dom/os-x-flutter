import 'package:flutter/material.dart';

enum ButtonColor {
  primary,
  secondary,
  error,
}

class LoadingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final ButtonColor color;
  final bool isLoading;

  const LoadingButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color = ButtonColor.primary,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    // Map the ButtonColor enum to the corresponding theme colors
    switch (color) {
      case ButtonColor.primary:
        buttonColor = Theme.of(context).colorScheme.primary;
        break;
      case ButtonColor.secondary:
        buttonColor = Theme.of(context).colorScheme.secondary;
        break;
      case ButtonColor.error:
        buttonColor = Theme.of(context).colorScheme.error;
        break;
      default:
        buttonColor = Theme.of(context).colorScheme.primary;
        break;
    }

    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Visibility(
            visible: !isLoading,
            child: Text(label),
          ),
          Visibility(
            visible: isLoading,
            child: const SizedBox(
              width: 18.0,
              height: 18.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
