import 'package:dart_practice/dart_practice.dart' as lib;
import 'package:dart_practice/practice4.dart' as practice4_lib;

void runPractice() {
  print("---------------------------------------------------");
  print("Questions for Practice 4");
  print("---------------------------------------------------");

  print("1. Create a list of names and print all names using list.");
  List<String> names = ["Nhorwin", "John", "Villano"];
  // using print list
  print(names);
  print("\n");
  //using for in
  for (var name in names) {
    print(name);
  }
  print("\n");

  print("2. Create a set of fruits and print all fruits using loop.");
  Set<String> fruits = {"Apple", "Orange", "Mango"};
  // using for in
  for (String fruit in fruits) {
    print(fruit);
  }
  print("\n");

  print(
      "3. Create a program thats reads list of expenses amount using user input and print total.");
  List<double> expenses = [];
  double total = 0.0;
  print('Enter your expenses, one amount per line. Enter "done" to finish:');
  while (true) {
    String userInput = lib.inputString();
    if (userInput.toLowerCase() == 'done') {
      break;
    }
    double? expenseAmount =
        double.tryParse(userInput); // Check if userInput is a valid double
    if (expenseAmount != null) {
      expenses.add(expenseAmount);
      total += expenseAmount;
    } else {
      print(
          'Invalid input. Please enter a valid expense amount or "done" to finish.');
    }
  }
  print('\nList of expenses: $expenses');
  print('Total expenses: $total');
  print("\n");

  print(
      "4. Create an empty list of type string called days. Use the add method to add names of 7 days and print all days.");
  List<String> days = [];
  // Adding names of 7 days
  days.add('Monday');
  days.add('Tuesday');
  days.add('Wednesday');
  days.add('Thursday');
  days.add('Friday');
  days.add('Saturday');
  days.add('Sunday');
  // Printing all days
  for (String day in days) {
    print(day);
  }
  print("\n");

  print(
      "5. Add your 7 friend names to the list. Use where to find a name that starts with alphabet a.");
  List<String> friendNames = [
    'John',
    'Nhorwin',
    'Bob',
    'anna',
    'Chris',
    'Leo',
    'Angel'
  ];
  List<String> startWithA =
      friendNames.where((name) => name.toLowerCase().startsWith("a")).toList();
  print(startWithA);
  print("\n");

  print(
      "6. Create a map with name, address, age, country keys and store values to it. Update country name to other country and print all keys and values.");
  // Create a map with name, address, age, and country keys
  Map<String, dynamic> personalInfo = {
    'name': 'Nhorwin Villano',
    'address': 'Isabela',
    'age': 27,
    'country': 'Philippines'
  };
  // Print all keys and values before updating
  print('Keys and Values:');
  personalInfo.forEach((key, value) {
    print('$key: $value');
  });
  print("\n");
  // Update country name to another country
  personalInfo['country'] = 'USA';
  // Print all keys and values after update
  print('Keys and Values:');
  personalInfo.forEach((key, value) {
    print('$key: $value');
  });
  print("\n");

  print(
      "7. Create a map with name, phone keys and store some values to it. Use where to find all keys that have length 4.");
  // Create a map with 'name' and 'phone' keys
  Map<String, String> contactInfo = {
    'John': '1234',
    'Nhorwin': '8888',
    'Bob': '293212',
    'Anne': '692280',
  };
  // Use 'where' to find all phone keys that have length 4
  contactInfo.removeWhere((key, value) => value.length != 4);
  // Print all phone keys with length 4
  print('Phone keys with length 4:');
  contactInfo.forEach((key, value) {
    print('$key: $value');
  });
  print("\n");

  print(
      "8. Create a simple to-do application that allows user to add, remove, and view their task.");
  practice4_lib.ToDo toDo = practice4_lib.ToDo();
  int? option;
  while (option != 4) {
    toDo.displayOption();
    option = lib.inputInteger();
    switch (option) {
      case 1:
        toDo.addTask();
        break;
      case 2:
        toDo.removeTask();
        break;
      case 3:
        toDo.displayTasks();
        break;
      case 4:
        break;
      default:
        print("Invalid Input!");
        break;
    }
  }
  print("\n");
}
