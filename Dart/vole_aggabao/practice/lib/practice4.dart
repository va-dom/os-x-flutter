import 'dart:io';
import 'package:practice/helpers.dart' as helpers;
import 'src/practice4/todo/todo.dart' as todo;

void run() {
  print("-----------------------------------------------------------------");
  print(" Questions for Practice 4");
  print(" [1] Create a list of names and print all names using list.");
  print(" [2] Create a set of fruits and print all fruits using loop.");
  print(" [3] Create a program thats reads list of expenses amount using user input and print total.");
  print(" [4] Create an empty list of type string called days. Use the add method to add names of 7 days and print all days.");
  print(" [5] Add your 7 friend names to the list. Use where to find a name that starts with alphabet a.");
  print(" [6] Create a map with name, address, age, country keys and store values to it. Update country name to other country and print all keys and values.");
  print(" [7] Create a map with name, phone keys and store some values to it. Use where to find all keys that have length 4.");
  print(" [8] Create a simple to-do application that allows user to add, remove, and view their task.");
  print("-----------------------------------------------------------------");
  stdout.write("Select a Question: ");
  String choice = stdin.readLineSync()!;
  switch (choice) {
    case "1":
      question1();
      break;
    case "2":
      question2();
      break;
    case "3":
      question3();
      break;
    case "4":
      question4();
      break;
    case "5":
      question5();
      break;
    case "6":
      question6();
      break;
    case "7":
      question7();
      break;
    case "8":
      question8();
      break;
    default:
      print("Invalid input! Choice is not in the options!!");
  }
}


void question1() {
  print(" [1] Create a list of names and print all names using list.");
  List<String> names = ["John", "Jane", "Mary", "Anne"];
  print(names);
}

void question2() {
  print(" [2] Create a set of fruits and print all fruits using loop.");
  Set<String> fruits = {"Apple", "Banana", "Orange", "Mango"};
  for (String fruit in fruits) {
    print(fruit);
  }
}

void question3() {
  List<num> expenses = [];
  bool addExpense = true;
  print(" [3] Create a program thats reads list of expenses amount using user input and print total.");
  do {
    print("Enter your expense");
    String? expense = stdin.readLineSync();
    if (expense == null || helpers.isNumeric(expense) == false) {
      while (expense == null || helpers.isNumeric(expense) == false) {
        print("Invalid input. Enter a valid amount");
        expense = stdin.readLineSync();
      }
    }

    expenses.add(num.parse(expense));
    print("Would you like to add more (enter \"yes\" to add more or any to end)?");
    String? addMoreInput = stdin.readLineSync();
    if (addMoreInput != null) {
      if (addMoreInput.toLowerCase() == "yes") {
        addExpense = true;
      } else {
        addExpense = false;
      }
    }
  } while(addExpense);
  print("Total Expenses = ${expenses.fold(0, (num a, num b) => a + b)}");
}

void question4() {
  print(" [4] Create an empty list of type string called days. Use the add method to add names of 7 days and print all days.");
  List<String> days = [];
  days.add("Monday");
  days.add("Tuesday");
  days.add("Wednesday");
  days.add("Thursday");
  days.add("Friday");
  days.add("Saturday");
  days.add("Sunday");
  print(days);
}

void question5() {
  print(" [5] Add your 7 friend names to the list. Use where to find a name that starts with alphabet a.");
  List<String> names = ["John", "Jane", "Mary", "Anne", "Arthur"];
  print(names.where((name) => name.toLowerCase().substring(0, 1) == "a"));
}

void question6() {
  print(" [6] Create a map with name, address, age, country keys and store values to it. Update country name to other country and print all keys and values.");
  Map<String, String> user = {
    'name': "John Doe",
    'address': "2517 Gus Green West Preston, Vermont",
    'age': "26",
    'country': "United States"
  };
  user['country'] = "Philippines";
  print("Keys: ${user.keys}");
  print("Values: ${user.values}");
}

void question7() {
  print(" [7] Create a map with name, phone keys and store some values to it. Use where to find all keys that have length 4.");
  Map<String, String> user = {
    'name': "John Doe",
    'phone': "+1-734-476-9454"
  };
  print(user.keys.where((key) => key.length == 4));
}

void question8() {
  print(" [8] Create a simple to-do application that allows user to add, remove, and view their task.");
  todo.run(); 
}