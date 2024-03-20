import 'package:flutter/material.dart';
import 'package:flutter_test_1/constants/colors.dart';
import 'package:flutter_test_1/model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChange;
  final onDeleteItem;
  final onEditItem;
  final String selectedCategory;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onToDoChange,
    required this.onDeleteItem,
    required this.onEditItem,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              onToDoChange(todo);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            tileColor: Colors.white,
            leading: Icon(
              todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: tdBlue,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.todoText!,
                  style: TextStyle(
                    fontSize: 16,
                    color: tdBlack,
                    decoration: todo.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Category: ${todo.category}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: tdGrey,
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    _showEditDialog(context);
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.blue.shade900,
                  ),
                ),
                const SizedBox(width: 8.0), // Spacer
                GestureDetector(
                  onTap: () {
                    _showDeleteConfirmationDialog(context, todo.id!);
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String todoId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onDeleteItem(todo.id);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context) {
  TextEditingController editController = TextEditingController(text: todo.todoText);
  String selectedCategory = todo.category; // Initialize selected category with the current category

  List<String> categories = ["All", "Category A", "Category B", "Category C"]; // Define your categories here

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit To-Do'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: editController,
              decoration: const InputDecoration(labelText: 'New To-Do Text'),
            ),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                selectedCategory = newValue!;
              },
              items: categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: 'Category'),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              String newText = editController.text.trim();
              if (newText.isNotEmpty) {
                onEditItem(todo.copyWith(todoText: newText, category: selectedCategory));
                Navigator.of(context).pop(); // Close the dialog
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter a non-empty to-do text.'),
                  ),
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

}