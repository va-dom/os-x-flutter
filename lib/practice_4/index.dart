import 'dart:io';
import 'package:dart_practices/style.dart' as style;
import 'package:dart_practices/todo.dart' as todo_app;

void runFunctions() {
  print('----- Start: Dart Practice #4: Q1 -----');
  stdout.write(style.Style.yellowish);
  print('----- Create a list of names and print all names using list. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  printAllNames();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #4: Q1 ----- \n');

  print('----- Start: Dart Practice #4: Q2 -----');
  stdout.write(style.Style.yellowish);
  print('----- Create a set of fruits and print all fruits using loop. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  printAllFruit();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #4: Q2----- \n');

  print('----- Start: Dart Practice #4: Q3 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Create a program thats reads list of expenses amount using user input and print total. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  printTotalExpenses();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #4: Q3 ----- \n');

  print('----- Start: Dart Practice #4: Q4 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Create an empty list of type string called days. Use the add method to add names of 7 days and print all days. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  printDays();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #4: Q4 ----- \n');

  print('----- Start: Dart Practice #4: Q5 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Add your 7 friend names to the list. Use where to find a name that starts with alphabet a. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  printFriendsStartingWithA();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #4: Q5 ----- \n');

  print('----- Start: Dart Practice #4: Q6 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Create a map with name, address, age, country keys and store values to it. Update country name to other country and print all keys and values. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  updateCountry();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #4: Q6 ----- \n');

  print('----- Start: Dart Practice #4: Q7 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Create a map with name, phone keys and store some values to it. Use where to find all keys that have length 4. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  findKeysWithLength4();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #4: Q7 ----- \n');

  print('----- Start: Dart Practice #4: Q7 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Create a simple to-do application that allows user to add, remove, and view their task. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  createToDo();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #4: Q7 ----- \n');
}

// Create a list of names and print all names using list.
void printAllNames() {
  List<String> names = ['Alice', 'Bob', 'Charlie', 'David', 'Emily'];

  for (int i = 0; i < names.length; i++) {
    print(names[i]);
  }

  // print(names);
}

// Create a set of fruits and print all fruits using loop.
void printAllFruit() {
  Set<String> fruits = {
    'apple',
    'banana',
    'orange',
    'mango',
    'grape',
    'pineapple'
  };

  for (int i = 0; i < fruits.length; i++) {
    print(fruits.elementAt(i));
  }
}

// Create a program thats reads list of expenses amount using user input and print total.
void printTotalExpenses() {
  List<double> expenses = [];
  double sum = 0;
  for (int i = 0; i < 5; i++) {
    print('Enter an expense:');
    expenses.add(double.parse(stdin.readLineSync()!));
    sum += expenses[i];
  }

  print('total is: $sum');
}

// Create an empty list of type string called days. Use the add method to add names of 7 days and print all days.
void printDays() {
  List<String> days = [];
  days.add('Monday');
  days.add('Tuesday');
  days.add('Wednesday');
  days.add('Thursday');
  days.add('Friday');
  days.add('Saturday');
  days.add('Sunday');

  print(days);
}

// Add your 7 friend names to the list. Use where to find a name that starts with alphabet a.
void printFriendsStartingWithA() {
  List<String> friends = [
    'robertson',
    'elaine',
    'cookie',
    'john',
    'jane',
    'alice',
    'mang boy'
  ];

  List<String> isFound =
      friends.where((element) => element.startsWith('a')).toList();

  print(isFound);
}

// Create a map with name, address, age, country keys and store values to it. Update country name to other country and print all keys and values.
void updateCountry() {
  Map<String, dynamic> person = {
    'name': 'Robertson',
    'address': '123 Main St',
    'age': 25,
    'country': 'USA'
  };

  person.update('country', (_) => 'Canada');
  print(person);
}

// Create a map with name, phone keys and store some values to it. Use where to find all keys that have length 4.
void findKeysWithLength4() {
  Map<String, dynamic> person = {
    'name': 'Robertson',
    'phone': '123-456-7890',
  };

  List<String> keysWithLength4 =
      person.keys.where((key) => key.length == 4).toList();
  print(keysWithLength4);
}

// Create a simple to-do application that allows user to add, remove, and view their task.
void createToDo() {
  // List<String> tasks = [];

  // while (true) {
  //   print('Enter your task:');
  //   String task = stdin.readLineSync()!;

  //   if (task == 'quit') {
  //     break;
  //   } else if (task == 'clear') {
  //     tasks.clear();

  //     print(tasks);

  //     print('Tasks cleared successfully.');
  //   } else {
  //     tasks.add(task);

  //     print(tasks);

  //     print('Task added successfully.');
  //   }
  // }

  todo_app.Todo toDo = todo_app.Todo();

  while (true) {
    print('Choose an option:');
    print('1. Add Task');
    print('2. Remove Task');
    print('3. Exit');

    stdout.write('I choose: ');
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        stdout.write('Input task: ');
        String taskToAdd = stdin.readLineSync()!;
        toDo.addTask(taskToAdd);
        break;

      case '2':
        toDo.viewTasks();
        stdout.write('Select task to remove: ');
        String indexToRemove = stdin.readLineSync()!;
        toDo.removeTask(int.tryParse(indexToRemove) ?? -1);
        break;

      case '3':
        exit(0);

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
