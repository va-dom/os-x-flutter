import 'dart:io';

// Create a list of names and print all names using list.
void printAllNames() {
  List<String> names = ['Robertson', 'Elaine', 'Calix', 'Cookie'];

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

  print(sum);
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
    'calix',
    'cookie',
    'john',
    'jane',
    'alice'
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

  person.update('country', (value) => 'Canada');
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
void createToDoApp() {
  List<String> tasks = [];

  while (true) {
    print('Enter your task:');
    String task = stdin.readLineSync()!;

    if (task == 'quit') {
      break;
    } else {
      tasks.add(task);

      print(tasks);
    }

    print('Task added successfully.');
  }
}
