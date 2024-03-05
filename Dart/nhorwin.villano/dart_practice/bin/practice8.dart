import 'dart:io';
import 'package:dart_practice/practice8.dart' as practice8_lib;
import 'package:dart_practice/practice1.dart' as practice1_lib;

void runPractice() {
  print("---------------------------------------------------");
  print("Questions for Practice 8");
  print("---------------------------------------------------");

  print("1. Explain what is asynchronous programming in dart?");
  print(
      "Asynchronous programming in Dart allows a program to do multiple tasks at the same time.");
  print("\n");

  print("2. What is Future in dart?");
  print(
      "In dart, the Future represents a value or error that is not yet available.");
  print("\n");

  print(
      "3. Write a program to print current time after 2 seconds using Future.delayed()");
  print("Start");
  practice8_lib
      .printCurrTime()
      .then((value) => print("Question3: Current Time : $value"));
  print("End");
  print("CurrentTime will be printed after 2 seconds.");
  print("\n");

  print(
      "4. Write a program in dart that reads csv file and print it's content.");
  //Create file object
  File file = File(
      "/Users/nhorwinvillano/Desktop/TrainingRepo/Dart/nhorwin.villano/dart_practice/assets/file.csv");
  //Read file content
  String content = file.readAsStringSync();
  print(content);
  print("\n");

  print(
      "5. Write a program in dart that uses Future class to perform multiple asynchronous operations, wait for all of them to complete, and then print the results.");
  practice8_lib.printResult();
  print("\n");

  print(
      "6. Write a Dart program to calculate the sum of two numbers using async/await.");
  practice8_lib.getSum6();
  print("\n");

  print(
      "7. Write a Dart program that takes in two integers as input, waits for 3 seconds, and then prints the sum of the two numbers.");
  print("Enter Num1: ");
  int num1 = practice1_lib.inputInteger();
  print("Enter Num2: ");
  int num2 = practice1_lib.inputInteger();
  practice8_lib.getSum7(num1, num2);
  print("\n");

  print(
      "8. Write a Dart program that takes a list of strings as input, sorts the list asynchronously, and then prints the sorted list.");
  List<String> stringList = ['zebra', 'lion', 'elephant', 'tiger'];
  print('Original list: $stringList');
  practice8_lib
      .sortList(stringList)
      .then((value) => print('Question8: Sorted list: $value'));
  print("\n");

  print(
      "9. Write a Dart program that takes a list of integers as input, multiplies each integer by 2 asynchronously, and then prints the modified list.");
  List<int> intList = [1, 2, 3, 4];
  print('Original list: $intList');
  practice8_lib
      .doubleList(intList)
      .then((value) => print('Question9: Modified list: $value'));
  print("\n");

  print(
      "10. Write a Dart program that takes a string as input, reverses the string asynchronously, and then prints the reversed string.");
  print("Enter String: ");
  String str = practice1_lib.inputString();
  print('Original String: $str');
  practice8_lib
      .reverseString(str)
      .then((value) => print('Question10: Reversed list: $value'));
  print("\n");
}
