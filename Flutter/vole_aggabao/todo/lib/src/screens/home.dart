import 'package:flutter/material.dart';
import 'package:todo/src/data/db/task_db.dart';
import 'package:todo/src/data/db/category_db.dart';
import 'package:todo/src/data/models/category.dart';
import 'package:todo/src/data/models/status_filter.dart';
import 'package:todo/src/data/models/task.dart';
import 'package:todo/src/data/repositories/local_task_repository.dart';
import 'package:todo/src/data/repositories/local_category_repository.dart';
import 'package:todo/src/widgets/appbar.dart';
import 'package:todo/src/widgets/task/add_task_dialog.dart';
import 'package:todo/src/widgets/task/delete_task_dialog.dart';
import 'package:todo/src/widgets/task/edit_task_dialog.dart';
import 'package:todo/src/widgets/task/task_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TaskRepository _taskRepository = TaskRepository(TaskDb());
  final CategoryRepository _categoryRepository = CategoryRepository(CategoryDb());
  List<Category> _categories = [];
  bool _isLoading = true; // Track initial loading state
  List<Task> _tasks = []; // List to store tasks
  List<Task> _filteredTasks = []; // List to store filtered tasks
  String _searchFilter = '';
  StatusFilter _statusFilter = StatusFilter.all;
  int _categoryFilter = 0;

  @override
  void initState() {
    super.initState();
    _loadTasks(); // Load tasks when the widget is first initialized
    _loadCategories(); // Load tasks when the widget is first initialized
  }

  Future<dynamic> _openAddDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AddTaskDialog(
        taskRepository: _taskRepository,
        categories: _categories,
        onTaskAdded: (task) {
          _tasks.add(task);
          _reloadList();
        },
      ),
    );
  }
  
  // Shows the Edit dialog
  void _openEditDialog(Task task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditTaskDialog(
          taskRepository: _taskRepository,
          categories: _categories,
          task: task,
          onTaskUpdated: (updatedTask) {
            int taskToUpdateIndex = _tasks.indexOf(_tasks.firstWhere((task) => task.id == updatedTask.id));
            _tasks[taskToUpdateIndex] = updatedTask;
            _reloadList();
          },
        );
      }
    );
  }

  // Shows the Delete dialog
  void _openDeleteDialog(Task task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteTaskDialog(
          taskRepository: _taskRepository,
          task: task,
          onTaskDeleted: (deletedTask) {
            _tasks.remove(deletedTask);
            _reloadList();
          },
        );
      },
    );
  }
  
  void _filterTasks(String searchFilter, StatusFilter statusFilter, int categoryFilter) {
    setState(() {
      _searchFilter = searchFilter;
      _statusFilter = statusFilter;
      _categoryFilter = categoryFilter;
    });
    _reloadList();
  }

  void _reloadList() {
    List<Task> filteredTasks = _tasks.where((task) {
      return task.description.toLowerCase().contains(_searchFilter.toLowerCase());
    }).toList();
    
    switch (_statusFilter) {
      case StatusFilter.incomplete:
        filteredTasks = filteredTasks.where((task) => !task.completed).toList();
        filteredTasks.sort((a, b) {
          return a.dueDate.compareTo(b.dueDate);
        });
      case StatusFilter.completed:
        filteredTasks = filteredTasks.where((task) => task.completed).toList();
        filteredTasks.sort((a, b) {
          return a.dueDate.compareTo(b.dueDate);
        });
      case StatusFilter.all:
      default:
        filteredTasks = filteredTasks;
        // Sort tasks by incomplete first, then by due date
        filteredTasks.sort((a, b) {
          if (a.completed && !b.completed) {
            return 1;
          } else if (!a.completed && b.completed) {
            return -1;
          } else {
            return a.dueDate.compareTo(b.dueDate);
          }
        });
    }

    if (_categoryFilter > 0) {
      filteredTasks = filteredTasks.where((task) => task.categoryId == _categoryFilter).toList();
    }

    setState(() => _filteredTasks = filteredTasks);
  }

  void _loadTasks() async {
    List<Task> tasks = await _taskRepository.getAll();
    
    // Sort tasks by incomplete first, then by due date
    tasks.sort((a, b) {
      if (a.completed && !b.completed) {
        return 1; // a is completed, b is not, so a should come after b
      } else if (!a.completed && b.completed) {
        return -1; // a is not completed, b is completed, so a should come before b
      } else {
        return a.dueDate.compareTo(b.dueDate); // both are either completed or not, so sort by due date
      }
    });
    
    setState(() {
      _tasks = tasks;
      _filteredTasks = tasks;
      _isLoading = false;
    });
  }

  void _loadCategories() async {
    List<Category> categories = await _categoryRepository.getAll();
    setState(() => _categories = categories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppbar(
        categories: _categories,
        filterTasks: (searchFilter, categoryFilter) => {
          _filterTasks(searchFilter, _statusFilter, categoryFilter)
        },
      ),
      body: _isLoading ?
        const Center(child: CircularProgressIndicator()) :
        TaskList(
          taskRepository: _taskRepository,
          categoryRepository: _categoryRepository,
          tasks: _filteredTasks,
          categories: _categories,
          onTaskUpdated: _reloadList,
          onViewTask: (task) => _openEditDialog(task),
          onDeleteTask: (task) => _openDeleteDialog(task),
          onFiltered: (statusFilter) => _filterTasks(_searchFilter, statusFilter, _categoryFilter),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddDialog(context),
        shape: const CircleBorder(),
        tooltip: 'New Task',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
