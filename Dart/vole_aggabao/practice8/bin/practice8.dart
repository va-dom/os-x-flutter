import 'dart:io';
import 'package:practice8/practice8.dart' as practice8;

void main(List<String> arguments) {
  bool exit = false;
  while (!exit) {
    print("\x1B[2J\x1B[0;0H");
    print("-----------------------------------------------------------------");
    print(" Questions for Practice 8");
    print(" [1] Explain what is asynchronous programming in dart?");
    print(" [2] What is Future in dart?");
    print(" [3] Write a program to print current time after 2 seconds using Future.delayed().");
    print(" [4] Write a program in dart that reads csv file and print it’s content.");
    print(" [5] Write a program in dart that uses Future class to perform multiple asynchronous operations, wait for all of them to complete, and then print the results.");
    print(" [6] Write a Dart program to calculate the sum of two numbers using async/await.");
    print(" [7] Write a Dart program that takes in two integers as input, waits for 3 seconds, and then prints the sum of the two numbers.");
    print(" [8] Write a Dart program that takes a list of strings as input, sorts the list asynchronously, and then prints the sorted list.");
    print(" [9] Write a Dart program that takes a list of integers as input, multiplies each integer by 2 asynchronously, and then prints the modified list.");
    print(" [10] Write a Dart program that takes a string as input, reverses the string asynchronously, and then prints the reversed string.");
    print(" [x] To exit app");
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
        exit = true;
        break;
      case "4":
        question4();
        exit = true;
        break;
      case "5":
        question5();
        exit = true;
        break;
      case "6":
        question6();
        exit = true;
        break;
      case "7":
        question7();
        exit = true;
        break;
      case "8":
        question8();
        exit = true;
        break;
      case "9":
        question9();
        exit = true;
        break;
      case "10":
        question10();
        exit = true;
        break;
      case "x":
        print("Exiting app...");
        exit = true;
        break;
      default:
        print("Invalid input! Choice is not in the options!!");
    }
    if (!exit) {
      print("Press ENTER key to continue..");
      stdin.readLineSync();
    }
  }
}

void question1() {
  print(" [1] Explain what is asynchronous programming in dart?");
  print("Asynchronous programming in Dart allows you to perform time-consuming operations such as network requests, reading a file, or database operations without blocking the main thread of execution. It allows the app to remain responsive and handle multiple tasks at the same time.");
}

void question2() {
  print(" [2] What is Future in dart?");
  print("Future represents a value or an error of an asynchronous operation. ");
}

void question3() {
  print(" [3] Write a program to print current time after 2 seconds using Future.delayed().");
  print("Current time: ${DateTime.now()}");
  Future.delayed(Duration(seconds: 2), () {
    print("After 2 seconds: ${DateTime.now()}");
  });
}

/// Using then
void question4() {
  print(" [4] Write a program in dart that reads csv file and print it\u2019s content.");
  practice8.getCitiesCSV().then((content) {
    print(content);
  }).catchError((error) {
    print("Error reading file: $error");
  });
}

void question5() {
  print(" [5] Write a program in dart that uses Future class to perform multiple asynchronous operations, wait for all of them to complete, and then print the results.");
  
  List<Future<String>> futures = [
    practice8.getDelayedMessage("Delayed 3 seconds", 3),
    practice8.getDelayedMessage("Delayed 1 second", 1),
    practice8.getDelayedMessage("Delayed 2 seconds", 2)
  ];

  Future.wait(futures).then((List<String> messages) {
    print("All message received");
    for (String message in messages) {
      print(message);
    }
  });
}

/// Using async await
void question6() async {
  print(" [6] Write a Dart program to calculate the sum of two numbers using async/await.");
  
  num num1 = 5;
  num num2 = 8;
  num sum = await practice8.sum(num1, num2);
  print("$num1 + $num2 = $sum");
}

/// Using try-catch to catch errors
void question7() async {
  print(" [7] Write a Dart program that takes in two integers as input, waits for 3 seconds, and then prints the sum of the two numbers.");

  try {
    int num1 = 5;
    int num2 = 8;
    int sum = await practice8.delayedSum(num1, num2);
    print("$num1 + $num2 = $sum");
  } catch (err) {
    print(err);
  }
}

void question8() async {
  print(" [8] Write a Dart program that takes a list of strings as input, sorts the list asynchronously, and then prints the sorted list.");

  List<String> names = ['James', 'John', 'Robert', 'Michael', 'William', 'David', 'Richard', 'Joseph', 'Charles', 'Thomas', 'Mary', 'Patricia'];
  List<String> sortedNames = await practice8.sortList(names);

  print("Before sorting: $names");
  print("After sorting: $sortedNames");
}

void question9() async {
  print(" [9] Write a Dart program that takes a list of integers as input, multiplies each integer by 2 asynchronously, and then prints the modified list.");

  List<int> list = [1, 2, 3, 4, 5];
  List<int> modifiedList = await practice8.multiplyListBy2(list);

  print('Before multiplication: $list');
  print('\nAfter multiplication: $modifiedList');
}

void question10() async {
  print(" [10] Write a Dart program that takes a string as input, reverses the string asynchronously, and then prints the reversed string.");

  String text = "Write a Dart program that takes a string as input, reverses the string asynchronously, and then prints the reversed string.";
  String reversedString = await practice8.reverseString(text);
  print(reversedString);
}