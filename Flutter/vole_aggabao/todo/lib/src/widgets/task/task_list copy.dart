import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/src/data/models/category.dart';
import 'package:todo/src/data/models/status_filter.dart';
import 'package:todo/src/data/models/task.dart';
import 'package:todo/src/data/repositories/local_category_repository.dart';
import 'package:todo/src/data/repositories/local_task_repository.dart';

class TaskList extends StatefulWidget {
  final TaskRepository taskRepository;
  final CategoryRepository categoryRepository;
  final List<Task> tasks;
  final List<Category> categories;
  final Function(Task) onViewTask;
  final Function(Task) onDeleteTask;
  final void Function() onTaskUpdated;
  final void Function(String, StatusFilter, int) onFiltered;

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
  String _searchFilter = '';
  int _categoryFilter = 0;
  StatusFilter _statusFilter = StatusFilter.all;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (searchValue) {
              _searchFilter = searchValue;
              widget.onFiltered(searchValue, _statusFilter, _categoryFilter);
            },
          ),
          const SizedBox(height: 10),
          SegmentedButton(
            segments: const <ButtonSegment>[
              ButtonSegment(
                value: StatusFilter.all,
                label: Text('All'),
                icon: Icon(Icons.list_rounded),
              ),
              ButtonSegment(
                value: StatusFilter.incomplete,
                label: Text('Pending'),
                icon: Icon(Icons.pending_actions_rounded),
              ),
              ButtonSegment(
                value: StatusFilter.completed,
                label: Text('Completed'),
                icon: Icon(Icons.done_all_rounded),
              ),
            ],
            selected: {_statusFilter},
            onSelectionChanged: (newSelection) {
              _statusFilter = newSelection.first;
              widget.onFiltered(_searchFilter, _statusFilter, _categoryFilter);
            },
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 150,
              child: DropdownButtonFormField(
                value: _categoryFilter,
                items: [
                  // Add a All option at the beginning
                  const DropdownMenuItem(
                    value: 0,
                    child: Text('All'),
                  ),
                  ...widget.categories.map((category) {
                    return DropdownMenuItem<int>(
                      value: category.id,
                      child: Text(category.name),
                    );
                  }),
                ],
                onChanged: (int? selectedCategory) {
                  setState(() => _categoryFilter = selectedCategory ?? 0);
                  widget.onFiltered(_searchFilter, _statusFilter, selectedCategory ?? 0);
                },
                decoration: const InputDecoration(
                  labelText: 'Category Filter',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: widget.tasks.length + 1,
              itemBuilder: (context, index) {
                List<Task> tasks = widget.tasks;
                if (index < tasks.length) {
                  final task = tasks[index];
                  final formattedDueDate = DateFormat('MMM d, yyyy hh:mm a').format(task.dueDate);
                  // Using future builder to build list items
                  final categoryFuture = widget.categoryRepository.getOne(task.categoryId);
                  return GestureDetector(
                    onTap: () => widget.onViewTask(task),
                    child: ListTile(
                      key: Key(task.id), // Add a key to prevent rebuilding when hidden on scroll
                      title: Text(task.description),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Due Date: $formattedDueDate'),
                          const SizedBox(height: 5.0),
                          FutureBuilder(
                            future: categoryFuture,
                            initialData: null,
                            builder: (context, AsyncSnapshot<Category?> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting || snapshot.data == null) {
                                return const SizedBox(height: 26); // Placeholder for loading state
                              } else {
                                final category = snapshot.data!;
                                return Chip(
                                  key: Key('chip-${category.id}'),
                                  label: Text(
                                    category.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      height: 0,
                                    )
                                  ),
                                  visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
                                  backgroundColor: category.color,
                                );
                              }
                            },
                          )
                        ],
                      ),
                      leading: Checkbox(
                        value: task.completed,
                        onChanged: (value) {
                          setState(() => task.completed = value ?? false);
                          widget.taskRepository.updateTask(task);
                          widget.onTaskUpdated();
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => widget.onDeleteTask(task),
                      ),
                    ),
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