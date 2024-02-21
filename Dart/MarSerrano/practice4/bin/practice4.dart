import 'dart:io';

import 'package:practice4/practice4.dart' as practice4;

//function that add numbers from a list
void addList (String expensesInput) {
  List<String> expensesInString = expensesInput.split(",");
  List<double> expenses = [];
  double total = 0;
  for (String e in expensesInString) {
    expenses.add(double.parse(e));
  }

  for (int i = 0; i < expenses.length; i++) {
    total = total + expenses[i];
  }

  print("Your total is : $total");

}

void main(List<String> arguments) {
  //Question 1
  print("==================Question 1==================");
  print("Create a list of names and print all names using list.");
  List<String> names = ["Mar", "Christian", "Serrano"];
  print(names);

  //Question 2
  print("==================Question 2==================");
  print("Create a set of fruits and print all fruits using loop.");
  Set<String> fruits = {"Apples", "Banana", "Coconut"};

  for(String fruit in fruits) {
    print(fruit);
  }

  //Question 3
  print("==================Question 3==================");
  print("Create a program thats reads list of expenses amount using user input and print total.");
  print("Enter list of expenses amount (e.g 1,2,3) : ");

  String expensesInput = stdin.readLineSync()!;
  addList(expensesInput);

  //Question 4
  print("==================Question 4==================");
  print("Create an empty list of type string called days. Use the add method to add names of 7 days and print all days.");
  List<String> days = [];

  days.add("Sunday");
  days.add("Monday");
  days.add("Tuesday");
  days.add("Wednesday");
  days.add("Thursday");
  days.add("Friday");
  days.add("Saturday");

  print(days);

  //Question 5
  print("==================Question 5==================");
  print("Add your 7 friend names to the list. Use where to find a name that starts with alphabet a.");
  List<String> friends = ["James","Kiel","Angel","Fitz","Ian","Bren","Alain"];
  print("All friends: $friends");
  List<String> friendsA = 
    friends.where((name) => name.startsWith("A")).toList();
  print("Friends that start with a : $friendsA");

  //Question 6
  print("==================Question 6==================");
  print("Create a map with name, address, age, country keys and store values to it. Update country name to other country and print all keys and values.");
  Map<String, dynamic> details= {};

  print("Enter your name:");
  details['Name'] = stdin.readLineSync()!;

  print("Enter your age:");
  details['Age'] = stdin.readLineSync()!;

  print("Enter your country:");
  details['Country'] = stdin.readLineSync()!;

  print("Your initial details: $details");

  print("Update your country:");
  details['Country'] = stdin.readLineSync()!;

  print("Your new details: $details");

  //Question 7
  print("==================Question 7==================");
  print("Create a map with name, phone keys and store some values to it. Use where to find all keys that have length 4.");
  Map<String, String> newDetails = {};
  print("Enter your name:");
  newDetails['Name'] = stdin.readLineSync()!;
  print("Enter your phone:");
  newDetails['Phone'] = stdin.readLineSync()!;
  print("Your details: $newDetails");

  newDetails.removeWhere((key, value) => key.length != 4);
  print("Your new details : $newDetails");

  //Question 8
  print("==================Question 8==================");
  print("Create a simple to-do application that allows user to add, remove, and view their task.");
  bool isContinue = true;
  List<String> tasks = [];

  while (isContinue) {
    print("Your tasks: ");
      if(tasks.isEmpty) {
        print("You have no tasks.");
      }
      else {
        for (int i = 0; i < tasks.length; i++) {
          print("${i+1}) ${tasks[i]}");
        }
      }

    print('''
    a. Add Task
    b. Remove Task
    c. Exit''');

    print("What do you want to do: ");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case 'a': //Add Task
        print("Add task : ");
        tasks.add(stdin.readLineSync()!);     
        print("Task added.");
        break;

      case 'b': //Remove Task
        print("Remove task number: ");
        int removeTask = int.parse(stdin.readLineSync()!);
        try {
          tasks.removeAt(removeTask - 1);
        }
        catch (ex) {
          print("No corresponding task.");
        }
        break;       

      case 'c': //Exit
        isContinue = false;
        break;

      default:
        print("Invalid choice.");
        break;
    }
    
  }
  

}
