import 'dart:io';
import 'package:dart_practice_app/dart_practice_8.dart' as practice_eight_func;

void runPractice() async {
  print(" PRACTICE 8 ");

  print(
      "3. Write a program to print current time after 2 seconds using Future.delayed()");
  print('Program started');
  print({practice_eight_func.printTimeAfterDelay(Duration(seconds: 2))});

  print(
      "4. Write a program in dart that reads csv file and print it’s content.");
  File file = File(
      "/Users/andreaabrenica/Documents/VA_Apps/Dart/andrea_abrenica/students.csv");
  final contents = await file.readAsLines();

  for (final content in contents) {
    final values = content.split(",");
    print(values);
  }

  print(
      "5. Write a program in dart that uses Future class to perform multiple asynchronous operations, wait for all of them to complete, and then print the results.");
  Future<String> operation1() {
    return Future.delayed(Duration(seconds: 2), () => "First operation");
  }

  Future<String> operation2() {
    return Future.delayed(Duration(seconds: 2), () => "Second operation");
  }

  final results = await Future.wait([operation1(), operation2()]);
  print(results[0]);
  print(results[1]);

  print(
      "6. Write a Dart program to calculate the sum of two numbers using async/await.");
  Future<int> addNumbers(int num1, int num2) async {
    await Future.delayed(Duration(seconds: 2));
    return num1 + num2;
  }

  int sum = await addNumbers(5, 7);
  print("Total: $sum");

  print(
      "7. Write a Dart program that takes in two integers as input, waits for 3 seconds, and then prints the sum of the two numbers.");
  stdout.write('Enter the first number: ');
  int num1 = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the second number: ');
  int num2 = int.parse(stdin.readLineSync()!);

  // Wait for 3 seconds
  await Future.delayed(Duration(seconds: 3));

  // Calculate and Print the sum
  int summ = num1 + num2;
  print('The sum of $num1 and $num2 is $summ');

  print(
      "8. Write a Dart program that takes a list of strings as input, sorts the list asynchronously, and then prints the sorted list.");
  List<String> inputList = ['banana', 'apple', 'orange', 'grape'];

  try {
    List<String> sortedList = await Future.delayed(Duration(seconds: 1), () {
      inputList.sort();
      return inputList;
    });
    print('Sorted list: $sortedList');
  } catch (e) {
    print('Error occurred: $e');
  }

  print(
      "9. Write a Dart program that takes a list of integers as input, multiplies each integer by 2 asynchronously, and then prints the modified list.");
  Future<List<int>> doubleNumbersAsync(List<int> numbers) async {
    List<int> doubledNumbers = [];
    for (int number in numbers) {
      await Future.delayed(
          Duration(seconds: 1)); // Simulating an asynchronous operation
      doubledNumbers.add(number * 2);
    }
    return doubledNumbers;
  }

  final List<int> numbers = [1, 2, 3, 4, 5];

  print("Original List: $numbers");
  doubleNumbersAsync(numbers).then((doubledNumbers) {
    print("Doubled List: $doubledNumbers");
  });

  print(
      "10. Write a Dart program that takes a string as input, reverses the string asynchronously, and then prints the reversed string.");
  Future<String> reverseStringAsync(String input) async {
    await Future.delayed(
        Duration(seconds: 1)); // Simulating an asynchronous operation
    return input.split('').reversed.join();
  }

  String input = "Hello, world!";

  print("Original String: $input");

  String reversedString = await reverseStringAsync(input);

  print("Reversed String: $reversedString");
}
