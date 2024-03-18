import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

enum CustomCheckboxState { empty, checked, cross }

class CustomCheckbox extends StatelessWidget {
  final String title;
  final ValueNotifier<CustomCheckboxState> initialValue;
  final Function(CustomCheckboxState) onChanged;

  const CustomCheckbox({
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(color: myFontColor),),
      leading: ValueListenableBuilder<CustomCheckboxState>(
        valueListenable: initialValue,
        builder: (context, value, child) {
          IconData newIcon;
          switch (value) {
            case CustomCheckboxState.checked:
              newIcon = Icons.check_box;
              break;
            case CustomCheckboxState.cross:
              newIcon = Icons.indeterminate_check_box;
              break;
            default:
              newIcon = Icons.check_box_outline_blank;
              break;
          }
          return IconButton(
            color: myFontColor,
            icon: Icon(newIcon),
            onPressed: () {
              onChanged(_getNextState(value));
            },
          );
        },
      ),
    );
  }

  CustomCheckboxState _getNextState(CustomCheckboxState currentState) {
    switch (currentState) {
      case CustomCheckboxState.checked:
        return CustomCheckboxState.cross;
      case CustomCheckboxState.cross:
        return CustomCheckboxState.empty;
      default:
        return CustomCheckboxState.checked;
    }
  }
}
