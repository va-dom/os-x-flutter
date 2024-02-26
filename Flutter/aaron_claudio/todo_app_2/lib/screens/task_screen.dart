import 'package:flutter/material.dart';
import 'package:todo_app_2/models/task.dart';
import 'package:todo_app_2/utils/utils.dart';
import 'package:todo_app_2/widgets/task_list_tile.dart';

class TaskScreen extends StatefulWidget{
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task"),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index){
          final task = tasks[index];
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
          final task = await openAddTaskDialog(context: context);
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