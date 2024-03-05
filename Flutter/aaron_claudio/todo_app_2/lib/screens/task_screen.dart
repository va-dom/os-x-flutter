import 'package:flutter/material.dart';
import 'package:todo_app_2/models/category.dart';
import 'package:todo_app_2/models/task.dart';
import 'package:todo_app_2/utils/utils.dart';
import 'package:todo_app_2/widgets/task_list_tile.dart';

class TaskScreen extends StatefulWidget{
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>{

  late List<Task> tasks;
  late List<Category> categories;
  late TextEditingController _searchController;

  @override
  void initState(){
    super.initState();
    tasks = [];
    categories = [];
    _searchController = TextEditingController();
  }
  
  @override
  void dispose(){
    _searchController.dispose();
    super.dispose();
  }

  void _addCategory(String categoryName){
    setState(() {
      categories.add(Category(categoryName));
    });
  }

  List<Task> getFilteredTasks(String query){
    if(query.isEmpty){
      return tasks;
    }
    else{
      return tasks.where((task) {
        final tileMatches = task.title.toLowerCase().contains(query.toLowerCase());
        final descriptionMatches = task.description.toLowerCase().contains(query.toLowerCase());
        return tileMatches || descriptionMatches;
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search Task",
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: (){
                _searchController.clear();
                setState(() {});
              },
            ),
          ),
          onChanged: (value) => setState(() {}),
        ),//const Text("Task"),
      ),
      body: ListView.builder(
        itemCount: getFilteredTasks(_searchController.text).length,
        itemBuilder: (context, index){
          final filteredTasks = _searchController.text.isEmpty ? tasks : getFilteredTasks(_searchController.text);
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
                onAddCategory: _addCategory
              );
              if(newTask != null){
                tasks.removeWhere((element) => element.id == newTask.id);
                tasks.insert(0, newTask);
              }
              setState(() {});
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final task = await openAddTaskDialog(
            context: context,
            categories: categories,
            onAddCategory: _addCategory
          );
          if(task != null){
            tasks.add(task);
          }
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}