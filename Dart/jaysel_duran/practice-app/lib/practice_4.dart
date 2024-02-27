import 'dart:io';
import 'practice_app.dart' as lib;

getPrintNamesExcercise() {
  List<String> nameList = ["Jaysel", "John Carl", "Chacha", "Cheche", "Chichi", "Chocho", "Chuchu", "Percy", "Polly", "Mochi"];
  nameList.forEach((name) => print(name));
}

getPrintFruitsExcercise() {
  List<String> fruits = ["Apple", "Banana", "Orange", "Grape", "Strawberry", "Mango", "Pineapple", "Watermelon", "Kiwi", "Peach"];
  for (var fruit in fruits) {
    print(fruit);
  }
}

getExpenseTotalCalculatorExercise() {
  List<double> expenses = [];

  expenses.add(getOrder());

  int hasExpense = 1;

  while(hasExpense == 1) {
    stdout.write("Has other expenses? Write 1 for yes, 0 to compute total expense. ");
    hasExpense = int.parse(stdin.readLineSync()!);

    if(hasExpense == 1) {
      expenses.add(getOrder());
    } else {
      hasExpense = 0;
    }
  }

  double totalExpenses = calculateTotalExpenses(expenses);
  print("Total expense: $totalExpenses");
}

double getOrder() {
  stdout.write("Enter your expense: ");
  return double.parse(stdin.readLineSync()!);
}

double calculateTotalExpenses(List<double> expenses) {
  double total = expenses.reduce((value, element) => value + element);
  return total;
}

getDaysExercise() {
  List<String> weekdays = [];
  weekdays.addAll(["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]);
  weekdays.forEach((day) => print(day));
}

bool getNameFinderExcercise(String name) {
  List<String> nameList = ["Alice", "Benjamin", "Chloe", "David", "Emma", "Fiona", "George"];
  return nameList.where((element) => element == name).isNotEmpty;
}

getPlaceExercise() {
  Map<String, dynamic> person = {
    'name': 'John',
    'address': '123 Main St',
    'age': 30,
    'country': 'USA',
  };

  person['country'] = 'Canada';

  person.forEach((key, value) {
    print('$key: $value');
  });
}

getMapExercise() {
  Map<String, String> contacts = {
    'Jaysel': '1234567890',
    'Carl': '9876543210',
    'Chuchu': '4567890123',
    'Percy': '6543210987',
    'Polly': '8847474747',
    'Mochi': '1828282828'
  };

  var keysWithLengthFour = contacts.keys.where((key) => key.length == 4);

  print("Keys with length 4:");
  for (var key in keysWithLengthFour) {
    print(key);
  }
}

addTask(List<String> tasks) {
  stdout.write('Enter task to add: ');
  var task = stdin.readLineSync();
  tasks.add(task!);
  print('Task added successfully!');
}

removeTask(List<String> tasks) {
  if (tasks.isEmpty) {
    print('No tasks to remove.');
    return;
  }

  viewTasks(tasks);
  stdout.write('Enter index of task to remove: ');
  var index = int.parse(stdin.readLineSync()!);

  if (index >= 0 && index < tasks.length) {
    tasks.removeAt(index);
    print('Task removed successfully!');
  } else {
    print('Invalid index. Please enter a number between 0 and ${tasks.length - 1}.');
  }
}

viewTasks(List<String> tasks) {
  if (tasks.isEmpty) {
    print('No tasks.');
    return;
  }

print('''
\n\n**********************
Tasks
''');
  for (var i = 0; i < tasks.length; i++) {
    print('$i: ${tasks[i]}');
  }
  print("**********************\n");
}

getTodoExercise() {
  List<String> tasks = [];

  while(true) {
    print('''
======================
Options:
  1. Add task
  2. Remove task
  3. View tasks
  4. Exit
======================\n
    ''');

    stdout.write('Enter your choice: ');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addTask(tasks);
        break;
      case 2:
        removeTask(tasks);
        break;
      case 3:
        viewTasks(tasks);
        break;
      case 4:
        print('Exiting...');
        return;
      default:
        {
          print('Invalid choice. Please enter a number between 1 and 4.');
        }
    }
  }
}


