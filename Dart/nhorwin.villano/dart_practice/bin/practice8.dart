import 'dart:io';

//Function for Question 3
Future<DateTime> currTime() async {
  return Future.delayed(Duration(seconds: 2), () => DateTime.now());
}

//Function for Question 5
Future<String> firstFunction() {
  return Future.delayed(
      Duration(seconds: 2), () => "Question5: 1st Function completed");
}

Future<String> secondFunction() {
  return Future.delayed(
      Duration(seconds: 2), () => "Question5: 2nd Function completed");
}

void getData() async {
  String data = await firstFunction();
  String data2 = await secondFunction();
  print(data);
  print(data2);
}

//Function for Question 6
Future<int> add(int num1, int num2) {
  return Future.delayed(Duration(seconds: 3), () => num1 + num2);
}

void getSum6(int num1, int num2) async {
  int sum = await add(num1, num2);
  print("Question6: Sum: $sum");
}

//Function for Question 7
void getSum7(int num1, int num2) async {
  int sum = await add(num1, num2);
  print("Question7: Sum: $sum");
}

void main() {
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
  currTime().then((value) => print("Question3: Current Time : $value"));
  print("End");
  print("CurrentTime will be printed after 2 seconds.");
  print("\n");

  print(
      "4. Write a program in dart that reads csv file and print it’s content.");
  //Create file object
  File file = File(
      "/Users/nhorwinvillano/Desktop/TrainingRepo/Dart/nhorwin.villano/dart_practice/assets/file.csv");
  //Read file content
  String content = file.readAsStringSync();
  print(content);
  print("\n");

  print(
      "5. Write a program in dart that uses Future class to perform multiple asynchronous operations, wait for all of them to complete, and then print the results.");
  getData();
  print("\n");

  print(
      "6. Write a Dart program to calculate the sum of two numbers using async/await.");
  getSum6(1, 2);
  print("\n");

  print(
      "7. Write a Dart program that takes in two integers as input, waits for 3 seconds, and then prints the sum of the two numbers.");
  print("Enter Num1: ");
  int? num1 = int.parse(stdin.readLineSync()!);
  print("Enter Num2: ");
  int? num2 = int.parse(stdin.readLineSync()!);
  getSum7(num1, num2);
  print("\n");
}
