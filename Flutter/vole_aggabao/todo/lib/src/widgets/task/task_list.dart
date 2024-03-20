import 'package:flutter/material.dart';
import 'package:todo/src/data/models/category.dart';
import 'package:todo/src/data/models/status_filter.dart';
import 'package:todo/src/data/models/task.dart';
import 'package:todo/src/data/repositories/local_category_repository.dart';
import 'package:todo/src/data/repositories/local_task_repository.dart';
import 'package:todo/src/widgets/task/task_list_item.dart';

class TaskList extends StatefulWidget {
  final TaskRepository taskRepository;
  final CategoryRepository categoryRepository;
  final List<Task> tasks;
  final List<Category> categories;
  final Function(Task) onViewTask;
  final Function(Task) onDeleteTask;
  final void Function() onTaskUpdated;
  final void Function(StatusFilter) onFiltered;

  const TaskList({
    super.key,
    required this.taskRepository,
    required this.categoryRepository,
    required this.tasks,
    required this.categories,
    required this.onViewTask,
    required this.onTaskUpdated,
    required this.onDeleteTask,
    required this.onFiltered,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  StatusFilter _statusFilter = StatusFilter.all;
  
  Color getTextColor(Color backgroundColor) {
    // Calculate the luminance of the background color
    double luminance = backgroundColor.computeLuminance();
    // Choose a contrasting text color based on the luminance
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              ChoiceChip(
                showCheckmark: false,
                label: const Wrap(
                  spacing: 5,
                  children: [
                    Icon(Icons.list),
                    Text('All'),
                  ]
                ),
                selected: _statusFilter == StatusFilter.all,
                onSelected: (bool selected) {
                  _statusFilter = selected ? StatusFilter.all : StatusFilter.all;
                  widget.onFiltered(_statusFilter);
                },
              ),
              ChoiceChip(
                showCheckmark: false,
                label: const Wrap(
                  spacing: 5,
                  children: [
                    Icon(Icons.pending_actions_rounded),
                    Text('Pending'),
                  ]
                ),
                selected: _statusFilter == StatusFilter.incomplete,
                onSelected: (bool selected) {
                  _statusFilter = selected ? StatusFilter.incomplete : StatusFilter.all;
                  widget.onFiltered(_statusFilter);
                },
              ),
              ChoiceChip(
                showCheckmark: false,
                label: const Wrap(
                  spacing: 5,
                  children: [
                    Icon(Icons.done_all_rounded),
                    Text('Completed'),
                  ]
                ),
                selected: _statusFilter == StatusFilter.completed,
                onSelected: (bool selected) {
                  _statusFilter = selected ? StatusFilter.completed : StatusFilter.all;
                  widget.onFiltered(_statusFilter);
                },
              ),
            ]
          ),
          const SizedBox(height: 10),
          Expanded(
            child: widget.tasks.isEmpty
            ? const Center(child: Text('No tasks found...'))
            : ListView.builder(
              itemCount: widget.tasks.length + 1,
              itemBuilder: (context, index) {
                List<Task> tasks = widget.tasks;
                if (index < tasks.length) {
                  final Task task = tasks[index];
                  final Category category = widget.categories.firstWhere((category) => category.id == task.categoryId);
                  return TaskListItem(
                    task: task,
                    category: category,
                    onViewTask: (task) => widget.onViewTask(task),
                    onCompleteTask: (task, value) {
                      setState(() => task.completed = value);
                      widget.taskRepository.updateTask(task);
                      widget.onTaskUpdated();
                    },
                    onDeleteTask: (task) => widget.onDeleteTask(task),
                  );
                } else {
                  return const SizedBox(height: 80);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}