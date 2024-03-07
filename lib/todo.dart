class Todo {
  List<String> tasks = [];

  void addTask(String task) {
    tasks.add(task);
    print('Task added: $task');

    viewTasks();
  }

  void removeTask(int index) {
    if (index >= 0 && index < tasks.length) {
      String removedTask = tasks.removeAt(index);
      print('Task removed: $removedTask');

      viewTasks();
    } else {
      print('Not Found');
    }
  }

  void viewTasks() {
    print('\nTasks:');
    for (int i = 0; i < tasks.length; i++) {
      print('$i. ${tasks[i]}');
    }
    print('');
  }
}
