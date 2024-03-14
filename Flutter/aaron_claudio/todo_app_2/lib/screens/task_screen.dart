import 'package:flutter/material.dart';
import 'package:todo_app_2/models/category.dart';
import 'package:todo_app_2/models/task.dart';
import 'package:todo_app_2/utils/firebase_service.dart';
import 'package:todo_app_2/utils/utils.dart';
import 'package:todo_app_2/widgets/task_list_tile.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late List<Task> tasks;
  late List<Category> categories;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    fetchTasksAndCategories();
  }

  Future<void> fetchTasksAndCategories() async {
    tasks = await FirebaseService.getTasks();
    categories = await FirebaseService.getCategories();
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _addCategory(String categoryName) async {
    // Create a new Category object with the provided name
    Category newCategory = Category(name: categoryName, reference: null);

    // Add the new category to Firestore
    await FirebaseService.addCategory(newCategory);

    // Refresh the tasks and categories lists
    await fetchTasksAndCategories();
  }

  List<Task> getFilteredTasks(String query) {
    if (query.isEmpty) {
      return tasks;
    } else {
      return tasks.where((task) {
        final tileMatches =
            task.title.toLowerCase().contains(query.toLowerCase());
        final descriptionMatches =
            task.description.toLowerCase().contains(query.toLowerCase());
        return tileMatches || descriptionMatches;
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "ToDo App",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search Task",
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {});
                      },
                    ),
                  ),
                  onChanged: (value) => setState(() {}),
                ),
              ),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
        shadowColor: Colors.black87,
        elevation: 8,
      ),
      body: ListView.builder(
        itemCount: getFilteredTasks(_searchController.text).length,
        itemBuilder: (context, index) {
          final filteredTasks = _searchController.text.isEmpty
              ? tasks
              : getFilteredTasks(_searchController.text);
          final task = filteredTasks[index];
          return TaskListTile(
            task: task,
            onDelete: () {
              tasks.removeWhere((element) => element.id == task.id);
              setState(() {});
            },
            onEdit: () async {
              final newTask = await openAddTaskDialog(
                  context: context,
                  task: task,
                  categories: categories,
                  onAddCategory: _addCategory);
              if (newTask != null) {
                tasks.removeWhere((element) => element.id == newTask.id);
                tasks.insert(0, newTask);
              }
              setState(() {});
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final task = await openAddTaskDialog(
              context: context,
              categories: categories,
              onAddCategory: _addCategory);
          if (task != null) {
            tasks.add(task);
          }
          setState(() {});
        },
        backgroundColor: Colors.blue[600],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
