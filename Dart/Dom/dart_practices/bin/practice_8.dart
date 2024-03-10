import 'dart:async';

void main() async {
  // Asynchronous programming in Dart
  print("What is asynchronous programming in Dart?");
  print(
      "Asynchronous programming in Dart allows you to perform tasks concurrently without blocking the main thread, improving performance and responsiveness.");

  // Future in Dart
  print("\nWhat is Future in Dart?");
  print(
      "A Future in Dart represents a potential value or error that will be available at some time in the future. It allows you to work with asynchronous operations by providing a way to obtain the result of the operation once it's completed.");

  // Print current time after 2 seconds using Future.delayed()
  print("\nPrinting current time after 2 seconds:");
  print("From ${DateTime.now()}");
  await Future.delayed(Duration(seconds: 2), () {
    print("To ${DateTime.now()}");
  });

  // Read and print CSV file content
  // print("\nReading and printing CSV file content:");
  // File file = File('example.csv');
  // List<String> lines = await file.readAsLines();
  // lines.forEach((line) => print(line));

  // Perform multiple asynchronous operations using Future class
  print("\nPerforming multiple asynchronous operations using Future class:");
  Future<String> operation1 =
      Future.delayed(Duration(seconds: 2), () => 'Result 1');
  Future<int> operation2 = Future.delayed(Duration(seconds: 3), () => 42);

  Future.wait([operation1, operation2]).then((results) {
    print(results); // prints: [Result 1, 42]
  });

  // Calculate the sum of two numbers using async/await
  print("\nCalculating the sum of two numbers using async/await:");
  int result = await calculateSum(3, 5);
  print(result); // prints: 8

  // Wait for 3 seconds and print the sum of two numbers
  print("\nWaiting for 3 seconds and printing the sum of two numbers:");
  calculateAndPrintSum(3, 5);

  // Sort a list of strings asynchronously
  print("\nSorting a list of strings asynchronously:");
  List<String> strings = ['banana', 'apple', 'orange'];
  List<String> sortedList = await sortList(strings);
  print(sortedList); // prints: [apple, banana, orange]

  // Multiply each integer in a list by 2 asynchronously
  print("\nMultiplying each integer in a list by 2 asynchronously:");
  List<int> numbers = [1, 2, 3, 4];
  List<int> modifiedList = await multiplyByTwo(numbers);
  print(modifiedList); // prints: [2, 4, 6, 8]

  // Reverse a string asynchronously
  print("\nReversing a string asynchronously:");
  String input = "hello";
  String reversedString = await reverseString(input);
  print(reversedString); // prints: olleh
}

Future<int> calculateSum(int a, int b) async {
  await Future.delayed(Duration(seconds: 3));
  return a + b;
}

void calculateAndPrintSum(int a, int b) async {
  await Future.delayed(Duration(seconds: 3));
  print("Sum: ${a + b}");
}

Future<List<String>> sortList(List<String> list) async {
  await Future.delayed(Duration(seconds: 2)); // Simulating async operation
  list.sort();
  return list;
}

Future<List<int>> multiplyByTwo(List<int> list) async {
  await Future.delayed(Duration(seconds: 2)); // Simulating async operation
  return list.map((number) => number * 2).toList();
}

Future<String> reverseString(String str) async {
  await Future.delayed(Duration(seconds: 2)); // Simulating async operation
  return str.split('').reversed.join('');
}
