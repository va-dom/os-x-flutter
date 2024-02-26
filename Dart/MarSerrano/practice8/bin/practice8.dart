import 'package:practice8/practice8.dart' as practice8;
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

//Question 3 Function
Future<String> getCurrentTime() async {
  final DateTime now = DateTime.now();
  DateFormat currTime = DateFormat("hh:mm:ss a");
  return Future.delayed(Duration(seconds: 2), () => "Question 3: ${currTime.format(now)}");
}

//Question 4 Function
Future readFile() async {
  File file = File("C:\\Users\\Mar\\Documents\\os-x-flutter\\Dart\\MarSerrano\\practice8\\StudentsGrades.csv");
  final fileContent = await file.readAsLines();
  print("Question 4:");
  for(final content in fileContent){
    final values = content.split(",");
    print(values);
  }
}

//Question 5 Function
void printResults() async{
  final results = await Future.wait([firstFunction(),secondFunction()]);
  print("Question 5: $results");
}

Future<String> firstFunction() {
  return Future.delayed(Duration(seconds: 2), () => "First function done!");
}

Future<String> secondFunction() {
  return Future.delayed(Duration(seconds: 2), () => "Second function done!");
}

//Question 6 Function
void printSum() async {
  int sum = await addNumbers(10,20);
  print("Question 6 Sum: $sum");
}

//Question 7 Function
void printSumInput(int num1 , int num2) async {
  int sum = await addNumbers(num1,num2);
  print("Question 7 Sum: $sum");
}

//Question 6&7 Reused Function
Future<int> addNumbers (int num1 , int num2) {
  return Future.delayed(Duration(seconds: 3), () => num1 + num2);
}

//Question 8 Function
void printSortedList(List<String> unsortedList) async {
  await sortList(unsortedList);
  print("Question 8 After sorting: $unsortedList");
}

Future<List<String>> sortList(List<String> unsortedList) async{
  return unsortedList..sort();
}

//Question 9 Function
void printNewList(String inputString) async {
  try {
    List<int> intList = await modifyList(inputString);
    print("Question 9 Modified List: $intList");
  }
  catch(e){
    print(e);
  }
  
}

Future<List<int>> modifyList (String inputString) {
  List<String> splittedList = inputString.split(",");
  List<int> intList = [];
  for(int i = 0; i <splittedList.length; i++) {
    try {
      intList.add((int.parse(splittedList[i])*2));
    }
    on FormatException {
      continue;
    }
    catch (e) {
      print(e);
    }
  }
    
  return Future.value(intList);
}

//Question 10 Function
void printReverseString(String inputString) async {
  String reversed = await reverseString(inputString);
  print("Question 10 Reversed String: $reversed");
}

Future<String> reverseString(String inputString) {
  return Future.value(inputString.split('').reversed.join());
}


void main(List<String> arguments) {
  //Question 1
  print("==================Question 1==================");
  print("Explain what is asynchronous programming in dart?");
  print("Asynchronous programming lets a program run multiple tasks at the same time without waiting for each other.");

  //Question 2
  print("==================Question 2==================");
  print("What is Future in dart?");
  print("Future in dart represents a potential value/error that is not yet available but will be available in the future.");

  //Question 3
  print("==================Question 3==================");
  print("Write a program to print current time after 2 seconds using Future.delayed().");
  print("The time 2 seconds ago is: ");
  getCurrentTime().then((value) => print(value));

  //Question 4
  print("==================Question 4==================");
  print("Write a program in dart that reads csv file and print it’s content.");
  readFile();

  //Question 5
  print("==================Question 5==================");
  print("Write a program in dart that uses Future class to perform multiple asynchronous operations, wait for all of them to complete, and then print the results.");
  printResults();

  //Question 6
  print("==================Question 6==================");
  print("Write a Dart program to calculate the sum of two numbers using async/await.");
  printSum();

  //Question 7
  print("==================Question 7==================");
  print("Write a Dart program that takes in two integers as input, waits for 3 seconds, and then prints the sum of the two numbers.");
  print("Enter first number:");
  int num1 = int.parse(stdin.readLineSync()!);
  print("Enter second number:");
  int num2 = int.parse(stdin.readLineSync()!);
  printSumInput(num1, num2);

  //Question 8
  print("==================Question 8==================");
  print("Write a Dart program that takes a list of strings as input, sorts the list asynchronously, and then prints the sorted list.");
  print("Enter list of string:");
  printSortedList(stdin.readLineSync()!.split(","));

  //Question 9
  print("==================Question 9==================");
  print("Write a Dart program that takes a list of integers as input, multiplies each integer by 2 asynchronously, and then prints the modified list.");
  print("Enter list of integers:");
  printNewList(stdin.readLineSync()!);
  

  //Question 10
  print("==================Question 10==================");
  print("Write a Dart program that takes a string as input, reverses the string asynchronously, and then prints the reversed string.");
  print("Enter a string:");
  printReverseString(stdin.readLineSync()!);

}
