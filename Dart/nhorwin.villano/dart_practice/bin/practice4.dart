import 'dart:io';

void runPractice() {
  print("---------------------------------------------------");
  print("Questions for Practice 1");
  print("---------------------------------------------------");

  print("1. Create a list of names and print all names using list.");
  List<String> names = ["Nhorwin", "John", "Villano"];
  print(names);
  print("\n");

  print("2. Create a set of fruits and print all fruits using loop.");
  Set<String> fruits = {"Apple", "Orange", "Mango"};
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
    String? userInput = stdin.readLineSync();
    if (userInput != null && userInput.toLowerCase() == 'done') {
      break;
    }
    double? expenseAmount = double.tryParse(userInput ?? '');
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
    'Anna',
    'Chris',
    'Leo',
    'Michael'
  ];
  List<String> startWithA =
      friendNames.where((element) => element.startsWith("A")).toList();
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
  // Update country name to another country
  personalInfo['country'] = 'USA';
  // Print all keys and values
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
    'Bob': '2932',
    'Carl': '692280',
  };
  // Use 'where' to find all phone keys that have length 4
  contactInfo.removeWhere((key, value) => value.length != 4);
  // Print all phone keys with length 4
  print('Phone keys with length 4:');
  for (var phoneKey in contactInfo.values) {
    print(phoneKey);
  }
  print("\n");
}
