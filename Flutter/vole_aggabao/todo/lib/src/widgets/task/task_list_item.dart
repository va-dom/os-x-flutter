import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/src/data/models/category.dart';
import 'package:todo/src/data/models/task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  final Category category;
  final Function(Task) onViewTask;
  final Function(Task, bool) onCompleteTask;
  final Function(Task) onDeleteTask;

  const TaskListItem({
    super.key,
    required this.task,
    required this.category,
    required this.onViewTask,
    required this.onCompleteTask,
    required this.onDeleteTask,
  });

  // Return text color based on background color luminance
  Color getTextColor(Color backgroundColor) {
    // Calculate the luminance of the background color
    double luminance = backgroundColor.computeLuminance();
    // Choose a contrasting text color based on the luminance
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDueDate = DateFormat('MMM d, yyyy hh:mm a').format(task.dueDate);
    final bool isDue = DateTime.now().isAfter(task.dueDate);
    
    return GestureDetector(
      onTap: () => onViewTask(task),
      child: ListTile(
        title: Text(
          task.description,
          style: TextStyle(decoration: task.completed ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                if (isDue && !task.completed) ...[
                  Icon(
                    Icons.error,
                    size: 20,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(width: 5),
                ],
                Text( 
                  'Until $formattedDueDate',
                  style: TextStyle(
                    decoration: task.completed ? TextDecoration.lineThrough : TextDecoration.none,
                    color: isDue && !task.completed ? Theme.of(context).colorScheme.error : null,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Chip(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              label: Text(
                category.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: getTextColor(category.color),
                  fontSize: 10,
                  height: 0,
                  decoration: task.completed ? TextDecoration.lineThrough : TextDecoration.none,
                )
              ),
              visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
              backgroundColor: category.color,
            )
          ],
        ),
        leading: Checkbox(
          value: task.completed,
          onChanged: (value) {
            onCompleteTask(task, value ?? false);
          },
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline_rounded),
          onPressed: () => onDeleteTask(task),
        ),
      )
    );
  }
}