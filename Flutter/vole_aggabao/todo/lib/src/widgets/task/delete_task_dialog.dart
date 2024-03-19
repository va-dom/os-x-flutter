import 'package:flutter/material.dart';
import 'package:todo/src/data/models/task.dart';
import 'package:todo/src/data/repositories/local_task_repository.dart';
import 'package:todo/src/widgets/loading_button.dart';

class DeleteTaskDialog extends StatefulWidget {
  final TaskRepository taskRepository;
  final Task task;
  final void Function(Task) onTaskDeleted;

  const DeleteTaskDialog({
    super.key,
    required this.taskRepository,
    required this.task,
    required this.onTaskDeleted,
  });

  @override
  State<DeleteTaskDialog> createState() => _DeleteTaskDialogState();
}

class _DeleteTaskDialogState extends State<DeleteTaskDialog> {
  bool _isDeleting = false;

  void _deleteTask() async {
    setState(() => _isDeleting = true);
    await widget.taskRepository.deleteTask(widget.task.id);
    widget.onTaskDeleted(widget.task);
    setState(() => _isDeleting = false);

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Task'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Are you sure you want to delete this task?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        LoadingButton(
          onPressed: _deleteTask,
          label: 'Delete',
          isLoading: _isDeleting,
          color: ButtonColor.error,
        ),
      ],
    );
  }
}
