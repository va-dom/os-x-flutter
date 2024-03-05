import 'package:dart_practice/practice1.dart' as practice1_lib;

// Class for ToDO
class ToDo {
  List<String> tasks = [
    'task1',
  ];

// Fuction for Question 8
  void displayOption() {
    print('\n-----Option------');
    print('[1] Add Task');
    print('[2] Remove Task');
    print('[3] View Tasks');
    print('[4] Exit');
    print('Enter the selected option:');
  }

  void displayTasks() {
    if (tasks.isEmpty) {
      print("There is no available task yet. Please add first!");
    } else {
      print('\n-----List of Tasks----');
      for (int i = 1; i <= tasks.length; i++) {
        print('$i : ${tasks[i - 1]}');
      }
    }
  }

  void addTask() {
    print('\n-----Add Task----');
    print('Enter task name:');
    String task = practice1_lib.inputString();
    tasks.add(task);
    print("Task '$task' has been added!");
  }

  void removeTask() {
    print('\n-----Remove Task----');
    print('Enter the Task Index:');
    int index = practice1_lib.inputInteger();
    if (index > 1 && index <= tasks.length) {
      tasks.removeAt(index - 1);
      print('Task $index has been removed!');
    } else {
      print('Invalid Input! Task Index is not existing.');
    }
  }
}
