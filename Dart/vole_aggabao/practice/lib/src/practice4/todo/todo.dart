import 'dart:io';

List<String> todoList = ["test"];
void run() {
  bool exitApp = false;
  String? choice;
  do {
    print("--------------");
    print("| To Do List |");
    print("--------------");
    for (int i = 0; i < todoList.length; i++) {
      print("[${i + 1}] ${todoList[i]}");
    }
    if (todoList.isEmpty) {
      print("No tasks found...");
    }
    print("-----------------");
    print("[A] Add New");
    print("[Q] Quit");
    stdout.write("View/edit/delete a task by entering the task's index: ");
    choice = stdin.readLineSync();

    if (choice != null) {
      if (choice.toLowerCase() == "a") {
        add();
      } else if (choice.toLowerCase() == "q") {
        exitApp = true;
      } else if (todoList.asMap().containsKey(int.parse(choice) - 1)) {
        view(int.parse(choice) - 1);
      }  else {
        print("Invalid input!!");
      }
    }
  } while (exitApp == false);
}

void view(int taskIndex) {
  print("-----------------");
  print("View Task");
  print(todoList[taskIndex]);
  bool validChoice = false;
  bool returnToMenu = false;
  do {
    stdout.write("[E] Edit | [D] Delete | [B] Go Back: ");
    String? choice = stdin.readLineSync();
    if (choice != null) {
        switch (choice.toLowerCase()) {
          case "e":
            edit(taskIndex);
            break;
          case "d":
            delete(taskIndex);
            returnToMenu = true;
            break;
          case "b":
            returnToMenu = true;
            break;
          default:
            break;
        }
    }
  } while (!validChoice && !returnToMenu);
}

void add() {
  print("-----------------");
  String? newTask;
  do {
    stdout.write("New task: ");
    newTask = stdin.readLineSync();
    if (newTask == null) {
      print("Please enter the content of the new task.");
    }
  } while (newTask == null);
  todoList.add(newTask);
  print("Task was added successfully.");
}

void edit(int taskIndex) {
  print("-----------------");
  String? updatedTask;
  do {
    print("Edit Task: ${todoList[taskIndex]}");
    stdout.write("Updated Task: ");
    updatedTask = stdin.readLineSync();
    if (updatedTask == null) {
      print("Please enter the content of the updated task.");
    }
  } while (updatedTask == null);
  todoList[taskIndex] = updatedTask;
  print("Task was updated successfully.");
  print("-----------------");
  print("View Task");
  print(todoList[taskIndex]);
}

void delete(int taskIndex) {
  print("-----------------");
  todoList.removeAt(taskIndex);
  print("Task was deleted successfully.");
}