//libraries
import 'dart:io';

//global
List<String> tasks = [];
void main(){
//variables
  
  print("TODO APP");
  getChoice();

}

void getChoice(){
  int x;
  String task;
  dynamic taskToRemove;
  print("\nSelect 1 to view tasks.");
  print("Select 2 to add task.");
  print("Select 3 to remove task.");
  print("Select 4 to exit app\n");
  stdout.write("What to do?  ");
  x = int.parse(stdin.readLineSync()!);
  
  switch (x) {
  case 1:
    viewList();
    getChoice();
  case 2:
    stdout.write("Enter task to add: ");
    task = stdin.readLineSync()!;
    addTask(task);
    getChoice();
  case 3:
    stdout.write("Enter task's id to remove: ");
    taskToRemove = int.parse(stdin.readLineSync()!);
    removeTask(taskToRemove);
    getChoice();
  case 4:
    print("\nexiting...");
    return;
  default:
    print("\ninvalid input");
    getChoice();
  }  
}

void viewList(){
  
  if(tasks.isEmpty){
    print("\nNo tasks added yet...");
  }
  else{
    print("\nHere are your tasks");
    for(int x = 0; x < tasks.length; x++){
      print("task ${x + 1}: ${tasks[x]}");
    }
  }
}


void addTask(String task){
  tasks.add(task);
  print("$task is added");
  print("");
}

void removeTask(int task){
  print("${tasks[task-1]} has been removed");
  tasks.removeAt(task-1);
  print("");
}