import 'package:flutter/material.dart';
import 'package:todo/src/data/models/category.dart';
import 'package:todo/src/data/models/task.dart';
import 'package:todo/src/data/repositories/local_task_repository.dart';
import 'package:todo/src/widgets/datetime_picker_text_field.dart';
import 'package:todo/src/widgets/loading_button.dart';

class AddTaskDialog extends StatefulWidget {
  final TaskRepository taskRepository;
  final List<Category> categories;
  final void Function(Task) onTaskAdded;

  const AddTaskDialog({
    super.key,
    required this.taskRepository,
    required this.categories,
    required this.onTaskAdded,
  });

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController _descriptionController = TextEditingController();
  Category? _selectedCategory;
  DateTime _dueDate = DateTime.now();
  Map<String, String> _formErrors = {};
  bool _isSaving = false;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void addTask() async {
    final String description = _descriptionController.text.trim();
    final int categoryId = _selectedCategory?.id ?? 0;
    bool hasError = false;

    setState(() => _formErrors = {});

    if (description.isEmpty) {
      hasError = true;
      setState(() => _formErrors['description'] = "Task description should not be empty");
    }

    if (categoryId == 0) {
      hasError = true;
      setState(() => _formErrors['category'] = "Select a category");
    }

    if (!hasError) {
      Task newTask = Task(
        id: '',
        description: description,
        categoryId: categoryId,
        dueDate: _dueDate,
      );

      setState(() => _isSaving = true);
      String taskId = await widget.taskRepository.addTask(newTask);
      Task localTask = Task(
        id: taskId,
        description: description,
        categoryId: categoryId,
        dueDate: _dueDate,
      );
      widget.onTaskAdded(localTask);
      setState(() => _isSaving = false);

      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Task'),
      contentPadding: const EdgeInsets.all(20),
      content: Container(
        width: double.maxFinite,
        constraints: const BoxConstraints(maxWidth: 400),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  errorText: _formErrors['description'],
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<Category>(
                value: _selectedCategory,
                items: widget.categories.map((Category category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.name),
                  );
                }).toList(),
                onChanged: (Category? newValue) {
                  setState(() => _selectedCategory = newValue!);
                },
                decoration: InputDecoration(
                  labelText: 'Category',
                  errorText: _formErrors['category'], // Show category selection error
                ),
              ),
              const SizedBox(height: 8),
              DateTimePickerTextField(
                labelText: 'Due Date',
                initialValue: _dueDate,
                onDateTimeChanged: (DateTime selectedDateTime) {
                  setState(() => _dueDate = selectedDateTime);
                }
              )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        LoadingButton(
          onPressed: addTask,
          label: 'Save',
          isLoading: _isSaving,
          color: ButtonColor.primary,
        ),
      ],
    );
  }
}
