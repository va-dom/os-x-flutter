class Todo {
  List<String> tasks = [];

  void addTask(String task) {
    tasks.add(task);
    print('Task added successfully!');

    viewTasks();
  }

  void removeTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
      viewTasks();
      print('Task removed successfully!');
    } else {
      throw Exception('Invalid index');
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
