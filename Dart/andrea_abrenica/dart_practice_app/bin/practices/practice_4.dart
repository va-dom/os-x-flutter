import 'dart:io';
import 'package:dart_practice_app/dart_practice_4.dart' as practice_four_func;

void runPractice() {
  print(" PRACTICE 4 ");

  print("1. Create a list of names and print all names using list.");
  List<String> names = ["Andeng", "Jays", "Ben", "Dom", "Lerry"];
  print("List of Names:");
  print(names);

  print("2. Create a set of fruits and print all fruits using loop.");
  Set<String> fruits = {"Apple", "Banana", "Orange", "Grapes", "Mango"};
  fruits.forEach(print);

  print(
      "3. Create a program thats reads list of expenses amount using user input and print total.");
  List<double> expenses = practice_four_func.readExpenses();
  double totalExpenses = practice_four_func.calculateTotalExpenses(expenses);
  print("Total expenses: \$${totalExpenses.toStringAsFixed(2)}");

  print(
      "4. Create an empty list of type string called days. Use the add method to add names of 7 days and print all days.");
  List<String> days = [];
  days.add("Monday");
  days.add("Tuesday");
  days.add("Wednesday");
  days.add("Thursday");
  days.add("Friday");
  days.add("Saturday");
  print(days);

  print(
      "5. Add your 7 friend names to the list. Use where to find a name that starts with alphabet a.");
  List<String> friends = [];
  friends.addAll(["Andeng", "Dom", "Jays", "Ben", "Alex", "Lerry", "June"]);
  List<String> friend =
      friends.where((element) => element.startsWith("A")).toList();
  friend.forEach(print);

  print(
      "6. Create a map with name, address, age, country keys and store values to it. Update country name to other country and print all keys and values.");
  Map<String, dynamic> personInfo = {
    'name': 'Andeng',
    'address': 'NPA Quezon City',
    'age': 18,
    'country': 'PH'
  };

  personInfo['country'] = 'USA';

  print('Keys and Values:');
  personInfo.forEach((key, value) {
    print('$key: $value');
  });

  print(
      "7.Create a map with name, phone keys and store some values to it. Use where to find all keys that have length 4.");
  Map<String, String> contacts = {
    'Ben': '09786545676',
    'Deng': '09876543456',
    'Dom': '09874560987',
    'Fran': '09678908765'
  };

  List<String> keysWithLength4 =
      contacts.keys.where((key) => key.length == 4).toList();
  print('Keys with length of 4: $keysWithLength4');

  print(
      "8. Create a simple to-do application that allows user to add, remove, and view their task.");
  List<String> todos = [];
  bool isAppOpen = true;
  while (isAppOpen) {
    print("\nEnter the number of selected option:");
    print("1. Add a task");
    print("2. Remove a task");
    print("3. View tasks");
    print("4. Quit");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        print("Enter the task name: ");
        String taskName = stdin.readLineSync()!;
        todos.add(taskName);
        print("Task added successfully!");
        break;
      case "2":
        if (todos.isEmpty) {
          print("No tasks to remove!");
        } else {
          print("Select a task to remove: ");
          int i = 1;
          for (String task in todos) {
            print("$i. $task");
            i++;
          }
          int? indexToRemove = int.tryParse(stdin.readLineSync()!);
          if (indexToRemove != null &&
              indexToRemove > 0 &&
              indexToRemove <= todos.length) {
            todos.removeAt(indexToRemove - 1);
            print("Task removed successfully!");
          } else {
            print("Invalid selection!");
          }
        }
        break;
      case "3":
        if (todos.isEmpty) {
          print("No tasks to view!");
        } else {
          int i = 1;
          for (String task in todos) {
            print("$i. $task");
            i++;
          }
        }
        break;
      case "4":
        print("Closing ToDo App!");
        //return;
        isAppOpen = false;
      default:
        print("Invalid choice!");
    }
  }
}
