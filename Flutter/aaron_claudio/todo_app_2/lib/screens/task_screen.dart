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
  // bool _categoriesLoaded = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    fetchTasksAndCategories();
  }

  Future<void> fetchTasksAndCategories() async {
    // tasks = await FirebaseService.getTasks();
    categories = await FirebaseService.getCategories();
    setState(() {
      // _categoriesLoaded = true;
    });
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
    // await fetchTasksAndCategories();
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
      //
      body: StreamBuilder<List<Task>>(
        stream: FirebaseService.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Task> tasks = snapshot.data ?? [];
            List<Task> filteredTasks = tasks.where((task) {
              final titleMatches = task.title
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase());
              final descriptionMatches = task.description
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase());
              return titleMatches || descriptionMatches;
            }).toList();
            return ListView.builder(
                itemCount: filteredTasks.length,
                itemBuilder: (context, index) {
                  final task = filteredTasks[index];
                  return TaskListTile(
                    task: task,
                    onEdit: () async {
                      await openAddTaskDialog(
                        context: context,
                        task: task,
                        onAddCategory: _addCategory,
                        categories: categories,
                      );
                      // if (newTask != null) {
                      //   FirebaseService.updateTask(newTask);
                      // }
                    },
                    onDelete: () {
                      FirebaseService.deleteTask(task.id as String);
                    },
                    onComplete: (isChecked) {
                      FirebaseService.completeTask(task.id!, isChecked);
                    },
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await openAddTaskDialog(
              context: context,
              categories: categories,
              onAddCategory: _addCategory);
          // if (task != null) {
          //   tasks.add(task);
          // }
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
