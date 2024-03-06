import 'dart:io';

void main(List<String> arguments) {
  print('-------------------Practice Question 4-------------------');
  
  //Question 1
  print('1. Create a list of names and print all names using list.');
  List<String> names = ["Yamaha", "Honda", "Suzuki"];
  names.forEach(print);

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 2
  print('2. Create a set of fruits and print all fruits using loop.');
  Set<String> fruits = {"Apple", "Orange", "Banana"};
  fruits.forEach(print);

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 3
  print('3. Create a program thats reads list of expenses amount using user input and print total.');
  List<double> expenses = [];

  while (true) {
    stdout.write("Enter an expense amount (or leave empty to finish): ");
    String input = stdin.readLineSync()!;
    if (input.isEmpty) {
      break;
    }
    double amount = double.tryParse(input)!; //returns null instead of throwing an exception
    expenses.add(amount);
  }
  double total = expenses.fold(0.0, (sum, amount) => sum + amount);
  print("Total expenses: P $total");

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 4
  print('4. Create an empty list of type string called days. Use the add method to add names of 7 days and print all days.');
  List<String> days = [];
  //days.addAll(["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]);
  days.add("Sunday");
  days.add("Monday");
  days.add("Tuesday");
  days.add("Wednesday");
  days.add("Thursday");
  days.add("Friday");
  days.add("Saturday");
  days.forEach(print);

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 5
  print('5. Add your 7 friend names to the list. Use where to find a name that starts with alphabet a.');
  List<String> friends = [];
  friends.addAll(["Alvin","Cedrick","Rabi","Jed","Kenroz","Jellmar","Allan"]);
  List<String> friend = friends.where((element) => element.startsWith("A")).toList();
  friend.forEach(print);

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 6
  print('6. Create a map with name, address, age, country keys and store values to it. Update country name to other country and print all keys and values.');
  Map<String, dynamic> info = {
    'name' : 'Aaron',
    'address' : 'Bulacan',
    'age' : 26,
    'country' : 'PH'
  };
  print('Before updating Country');
  print(info);
  info['country'] = 'US';
  print('After updating Country');
  print(info);

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 7
  print('7. Create a map with name, phone keys and store some values to it. Use where to find all keys that have length 4.');
  Map<String, dynamic> contacts = {
    'Aaron' : 0912345678,
    'John' : 0912345678,
    'Doe' : 09123123,
    'Goku' : 09124353

  };
  List<String> keysWithLength4 = contacts.keys.where((key) => key.length == 4).toList();
  print('Keys with length of 4: $keysWithLength4');

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 8
  print('8. Create a simple to-do application that allows user to add, remove, and view their task.');
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
          if (indexToRemove != null && indexToRemove > 0 && indexToRemove <= todos.length) {
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
