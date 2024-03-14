import 'package:flutter/material.dart';
import 'package:todo_app_2/models/task.dart';

class TaskListTile extends StatefulWidget {
  const TaskListTile({
    super.key,
    required this.task,
    required this.onEdit,
    required this.onDelete,
  });

  final Task task;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  State<TaskListTile> createState() => _TaskListTile();
}

class _TaskListTile extends State<TaskListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    decoration: widget.task.isChecked
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                Text(
                  widget.task.description,
                  style: TextStyle(
                    decoration: widget.task.isChecked
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  'Category: ${widget.task.categoryReference}',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                IconButton(
                  onPressed: widget.onDelete,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: widget.onEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                ),
                Checkbox(
                  value: widget.task.isChecked,
                  onChanged: (value) {
                    widget.task.isChecked = value!;
                    setState(() {});
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
