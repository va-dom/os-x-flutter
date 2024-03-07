import 'dart:io';

import 'package:practice_app/practice_app.dart' as main_util;

Future<String> getUsers() async {
  String filePath = 'assets/users_list.csv';
  File file = File(filePath);

  if (!file.existsSync()) {
    throw 'File not found';
  }

  return Future.value(file.readAsString());
}

void runPrintCSVContent() {
  getUsers().then((content) {
    print(content);
  }).catchError((error) {
    print("Error reading file: $error");
  });
}

void runPrintCurrentTimeWithDelay() {
  print("Program started");
  
  // Delay execution by 2 seconds
  Future.delayed(Duration(seconds: 2), () {
    print("Current time after 2 seconds: ${DateTime.now()}");
  });
  
  print("Program continued without waiting for the delay");
}

Future<int> asyncOperation1() async {
  await Future.delayed(Duration(seconds: 2));
  return 9;
}

Future<String> asyncOperation2() async {
  await Future.delayed(Duration(seconds: 3));
  return 'Hello';
}

void runAsyncSamples() async {
  print('Start');

  int result1 = await asyncOperation1();
  String result2 = await asyncOperation2();

  print('Result of operation 1: $result1');
  print('Result of operation 2: $result2');

  print('End');
}

Future<int> calculateSum(int a, int b) async {
  await Future.delayed(Duration(seconds: 3)); // Simulating some asynchronous operation
  return a + b;
}

void runSumSimulationUsingAsync() async {
  int num1 = 9, num2 = 18;

  print('Calculating sum...');
  
  int sum = await calculateSum(num1, num2);

  print('The sum of $num1 and $num2 is: $sum');
}

Future<void> runSumCalculatorUsingAsync() async {
  // Take input from the user
  stdout.write('Enter the first number: ');
  int num1 = main_util.getNumericInput();

  stdout.write('Enter the second number: ');
  int num2 = main_util.getNumericInput();

  print('Calculating sum...');
  
  // Wait for 3 seconds
  await Future.delayed(Duration(seconds: 3));
  
  // Calculate and print the sum
  int sum = num1 + num2;
  print('The sum of $num1 and $num2 is: $sum');
}

Future<List<String>> sortList(List<String> list) async {
  await Future.delayed(Duration(seconds: 2)); // Simulating some asynchronous operation
  list.sort();
  return list;
}

void runSortingUsingAsync() async {
  List<String> inputList = ['banana', 'apple', 'orange', 'grape'];
  print("Before Sorting: $inputList");

  print('Sorting list...');
  List<String> sortedList = await sortList(inputList);

  print('Sorted list: $sortedList');
}

Future<List<int>> multiplyListBy2(List<int> list) async {
  await Future.delayed(Duration(seconds: 2)); // Simulating some asynchronous operation
  return list.map((number) => number * 2).toList();
}

void runMultiplyListBy2UsingAsync() async {
  List<int> inputList = [1, 2, 3, 4, 5];
  print("Before List: $inputList");

  print('Multiplying list by 2...');
  List<int> modifiedList = await multiplyListBy2(inputList);

  print('Modified list: $modifiedList');
}

Future<String> reverseString(String input) async {
  await Future.delayed(Duration(seconds: 2)); // Simulating some asynchronous operation
  return input.split('').reversed.join('');
}

void runReversedStringUsingAsync() async {
  String inputString = 'hello world';
  print("Before reverse: $inputString");

  print('Reversing string...');
  String reversedString = await reverseString(inputString);

  print('Reversed string: $reversedString');
}