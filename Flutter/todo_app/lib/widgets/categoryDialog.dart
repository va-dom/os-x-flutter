import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/dbHelper.dart';

import '../constants/colors.dart';
import '../models/categories.dart';
import '../screens/taskList.dart';

class CategoryDialog extends StatefulWidget {
  final int? id;
  final TextEditingController labelController;
  final String? categoryLabel;

  CategoryDialog({
    this.id,
    required this.labelController,
    this.categoryLabel,
  });

  @override
  _CategoryDialogState createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return AlertDialog(
      backgroundColor: myOrangeAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      titlePadding: EdgeInsets.zero,
      title: Container(
          decoration: const BoxDecoration(
              color: myOrange,
              borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
                widget.categoryLabel == null
                    ? 'Add New Category'
                    : 'Update Category',
                style: const TextStyle(color: myFontColor)),
          )),
      contentPadding: EdgeInsets.zero,
      content: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              border: Border(
                  left: BorderSide(
                      color: myOrange, style: BorderStyle.solid, width: 2),
                  right: BorderSide(
                      color: myOrange, style: BorderStyle.solid, width: 2))),
          child: TextFormField(
              controller: widget.labelController,
              decoration: const InputDecoration(
                  labelText: 'Category Label',
                  labelStyle: TextStyle(color: myFontColor)),
              maxLength: 25,
              style: TextStyle(color: Colors.black),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Category Label is required';
                }
                return null;
              }),
        ),
      ),
      actionsPadding: EdgeInsets.zero,
      actions: <Widget>[
        Container(
            decoration: const BoxDecoration(
              color: myOrange,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel',
                        style: TextStyle(color: myFontColor, fontSize: 18)),
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: myOrangeAccent,
                              style: BorderStyle.solid,
                              width: 1))),
                  child: TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final newCategoryLabel = widget.labelController.text;
                        if (widget.categoryLabel == null) {
                          final category = Categories(
                            categoryLabel: widget.labelController.text,
                            isActive: true,
                          );
                          categoryProvider.addCategory(category);
                        } else {
                          final newCategory = Categories(
                              id: widget.id,
                              categoryLabel: newCategoryLabel,
                              isActive: true);

                          categoryProvider.updateCategory(newCategory);
                        }
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(widget.categoryLabel == null ? 'Add' : 'Update',
                        style:
                            const TextStyle(color: myFontColor, fontSize: 18)),
                  ),
                ))
              ],
            ))
      ],
    );
  }
}
