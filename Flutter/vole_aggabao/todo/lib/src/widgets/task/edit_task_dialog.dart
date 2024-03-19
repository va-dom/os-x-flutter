import 'package:flutter/material.dart';
import 'package:todo/src/data/models/category.dart';
import 'package:todo/src/data/models/task.dart';
import 'package:todo/src/data/repositories/local_task_repository.dart';
import 'package:todo/src/widgets/datetime_picker_text_field.dart';
import 'package:todo/src/widgets/loading_button.dart';

class EditTaskDialog extends StatefulWidget {
  final TaskRepository taskRepository;
  final List<Category> categories;
  final Task task;
  final void Function(Task) onTaskUpdated;

  const EditTaskDialog({
    super.key,
    required this.taskRepository,
    required this.categories,
    required this.task,
    required this.onTaskUpdated
  });

  @override
  State<EditTaskDialog> createState() => EditTaskDialogState();
}

class EditTaskDialogState extends State<EditTaskDialog> {
  late Task _task;
  late TextEditingController _descriptionController;
  Category? _selectedCategory;
  late DateTime _dueDate;
  Map<String, String> _formErrors = {};
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _task = widget.task;
    _descriptionController = TextEditingController(text: _task.description);
    _dueDate = _task.dueDate;
    _selectedCategory = widget.categories.where((category) => category.id == _task.categoryId).first;
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void editTask() async {
    final String id = widget.task.id;
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
      final Task updatedTask = Task(
        id: id,
        description: description,
        categoryId: categoryId,
        dueDate: _dueDate,
      );

      setState(() => _isSaving = true);
      await widget.taskRepository.updateTask(updatedTask);
      widget.onTaskUpdated(updatedTask);
      setState(() => _isSaving = false);

      if (mounted) { 
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {    
    return AlertDialog(
      title: const Text('Edit Task'),
      contentPadding: const EdgeInsets.all(20),
      content: Container(
        width: double.maxFinite,
        constraints: const BoxConstraints(maxWidth: 400),
        child: SingleChildScrollView(
          child: Column(
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
                items: [
                  // Add a null option at the beginning
                  const DropdownMenuItem<Category>(
                    value: null,
                    child: Text('None'),
                  ),
                  ...widget.categories.map((category) {
                    return DropdownMenuItem<Category>(
                      value: category,
                      child: Text(category.name),
                    );
                  }),
                ],
                onChanged: (Category? newValue) {
                  setState(() => _selectedCategory = newValue);
                },
                decoration: InputDecoration(
                  labelText: 'Category',
                  errorText: _formErrors['category'],
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
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        LoadingButton(
          onPressed: editTask,
          label: 'Save',
          isLoading: _isSaving,
          color: ButtonColor.primary,
        ),
      ],
    );
  }
}