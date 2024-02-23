import 'dart:io';
import 'package:dart_practice_app/dart_practice_app.dart' as main_func;
import 'package:dart_practice_app/dart_practice_3.dart' as practice_three_func;

void runPractice() {
  print(" PRACTICE 3 ");

  print("1. Write a program in Dart to print your own name using function.");
  print(" ${main_func.fullName} ");

  print(
      "2. Write a program in Dart to print even numbers between intervals using function.");
  practice_three_func.printEvenNumbers(1, 10);

  print(
      "3. Create a function called greet that takes a name as an argument and prints a greeting message. For example, greet(“John”) should print “Hello, John”.");
  practice_three_func.printJohn("John");

  print("4. Write a program in Dart that generates random password.");
  print(practice_three_func.generateRandomPassword());

  print(
      "5. Write a program in Dart that find the area of a circle using function. Formula: pi * r * r");
  practice_three_func.areaOfCircle();

  print('6. Write a program in Dart to reverse a String using function.');
  print('Enter text:');
  String? rev = stdin.readLineSync()!;
  print(
      'The reversed value of $rev is: ${practice_three_func.reverseString(rev)}');

  print(
      "7. Write a program in Dart to calculate power of a certain number. For e.g 5^3=125");
  print('Enter base number:');
  num? base = num.parse(stdin.readLineSync()!);
  print('Enter exponent:');
  num? expnt = num.parse(stdin.readLineSync()!);
  print('$base ^ $expnt = ${practice_three_func.calculatePow(base, expnt)}');

  print(
      "8. Write a function in Dart named add that takes two numbers as arguments and returns their sum.");
  print('Enter first number:');
  int? num1 = int.parse(stdin.readLineSync()!);
  print('Enter second number:');
  int? num2 = int.parse(stdin.readLineSync()!);
  print(
      'The sum of $num1 and $num2 is: ${practice_three_func.add(num1, num2)}');

  print(
      "9. Write a function in Dart called maxNumber that takes three numbers as arguments and returns the largest number.");
  print('Enter first number:');
  int? max1 = int.parse(stdin.readLineSync()!);
  print('Enter second number:');
  int? max2 = int.parse(stdin.readLineSync()!);
  print('Enter third number:');
  int? max3 = int.parse(stdin.readLineSync()!);
  print(
      'The largest number between $max1, $max2, and $max3 is: ${practice_three_func.maxNumber(max1, max2, max3)}');

  print(
      "10. Write a function in Dart called isEven that takes a number as an argument and returns True if the number is even, and False otherwise.");
  print('Enter number:');
  int? even = int.parse(stdin.readLineSync()!);
  print('is $even an even number? ${practice_three_func.isEven(even)}');

  print(
      "11. Write a function in Dart called createUser with parameters name, age, and isActive, where isActive has a default value of true.");
  print('Enter your Name');
  String? name = stdin.readLineSync()!;
  print('Enter your age');
  int? age = int.parse(stdin.readLineSync()!);
  Map<String, dynamic> user1 = practice_three_func.createUser(name, age);
  print('User successfully created.');
  print('Name: ${user1['name']}');
  print('Age: ${user1['age']}');
  print('IsActive: ${user1['isActive']}');

  print(
      "12. Write a function in Dart called calculateArea that calculates the area of a rectangle. It should take length and width as arguments, with a default value of 1 for both. Formula: length * width.");
  print('Enter length:');
  double? length = double.parse(stdin.readLineSync()!);
  print('Enter width:');
  double? width = double.parse(stdin.readLineSync()!);
  print(
      'The area of a reactangle with length of $length and width of $width is: ${practice_three_func.calculateArea(length, width)}');
}
