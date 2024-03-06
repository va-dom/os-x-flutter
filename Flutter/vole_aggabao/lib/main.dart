import 'package:flutter/material.dart';
import 'home/task.dart';

void main() {
  runApp(TodoApp());
}

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [];

  void addTask(String title) {
    setState(() {
      tasks.add(Task(title: title));
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index].title),
          leading: Checkbox(
            value: tasks[index].isDone,
            onChanged: (_) => toggleTask(index),
          ),
        );
      },
    );
  }
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('To-Do'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[800],
        ),
        body: TaskList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddTaskDialog(context),
          backgroundColor: Colors.grey[800],
          foregroundColor: Colors.white,
          shape: CircleBorder(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(controller: controller),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (controller.text.isNotEmpty) {
                  context.findAncestorStateOfType<_TaskListState>()?.addTask(controller.text);
                  controller.clear();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
