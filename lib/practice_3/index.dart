import 'package:dart_practices/practice_1/index.dart' as p1;
import 'package:dart_practices/calculation.dart' as calculation;
import 'package:dart_practices/style.dart' as style;
import 'dart:math';
import 'dart:io';

void runFunctions() {
  print('----- Start: Dart Practice #3: Q1 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Write a program in Dart to print your own name using function. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  callPrintNameFromPractice1();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #3: Q1 ----- \n');

  print('----- Start: Dart Practice #3: Q2 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Write a program in Dart to print even numbers between intervals using function. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  printEvenNumbers();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #3: Q2 ----- \n');

  print('----- Start: Dart Practice #3: Q3 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Create a function called greet that takes a name as an argument and prints a greeting message. -----');
  stdout.write(style.Style.reset);
  print('----- For example, greet(“John”) should print “Hello, John”. -----');
  stdout.write(style.Style.green);
  greet('Robertson Morales');
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #3: Q3 ----- \n');

  print('----- Start: Dart Practice #3: Q4 -----');
  stdout.write(style.Style.yellowish);
  print('----- Write a program in Dart that generates random password. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  generateRandomPassword(12);
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #3: Q4 ----- \n');

  print('----- Start: Dart Practice #3: Q5 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Write a program in Dart that find the area of a circle using function. Formula: pi * r * r -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  findAreaOfCircle(12);
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #3: Q5 ----- \n');

  print('----- Start: Dart Practice #3: Q6 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Write a program in Dart to reverse a String using function. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  reverseString('Robertson');
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #3: Q6 ----- \n');

  print('----- Start: Dart Practice #3: Q7 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Write a program in Dart to calculate power of a certain number. For e.g 5^3=125 -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  calculatePower(5, 3);
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #3: Q7 ----- \n');

  print('----- Start: Dart Practice #3: Q8 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Write a function in Dart named add that takes two numbers as arguments and returns their sum. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  sum(55, 45);
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #3: Q8 ----- \n');

  print('----- Start: Dart Practice #3: Q9 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Write a function in Dart called maxNumber that takes three numbers as arguments and returns the largest number. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  maxNumber(1, 2, 3);
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #3: Q9 ----- \n');

  print('----- Start: Dart Practice #3: Q10 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Write a function in Dart called isEven that takes a number as an argument and returns True if the number is even, and False otherwise. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  isEven(44);
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #3: Q10 ----- \n');

  print('----- Start: Dart Practice #3: Q11 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Write a function in Dart called isEven that takes a number as an argument and returns True if the number is even, and False otherwise. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  createUser("Robertson", 25, false);
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #3: Q11 ----- \n');

  print('----- Start: Dart Practice #3: Q12 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Write a function in Dart called createUser with parameters name, age, and isActive, where isActive has a default value of true. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  createUser("Robertson", 25, false);
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #3: Q12 ----- \n');

  print('----- Start: Dart Practice #3: Q13 -----');
  stdout.write(style.Style.yellowish);
  print(
      '----- Write a function in Dart called calculateArea that calculates the area of a rectangle. It should take length and width as arguments, with a default value of 1 for both. Formula: length * width. -----');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  calculateArea(12, 8);
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #3: Q13 ----- \n');
}

// Write a program in Dart to print your own name using function.
void callPrintNameFromPractice1() {
  p1.printName();
}

// Write a program in Dart to print even numbers between intervals using function.
void printEvenNumbers() {
  const count = 100;

  for (int i = 1; i <= count; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }
}

// Create a function called greet that takes a name as an argument and prints a greeting message.
// For example, greet(“John”) should print “Hello, John”.
void greet(String name) {
  print("Hello, $name");
}

// Write a program in Dart that generates random password.
void generateRandomPassword(int passwordLength) {
  Random random = Random.secure();
  List<int> alphabets = List.generate(26, (i) => 65 + i), // A-Z
      number = List.generate(10, (i) => 48 + i); // 0-9

  String password = String.fromCharCodes(alphabets).toUpperCase() +
      String.fromCharCodes(number);

  List<int> convertToCodeUnits = password.codeUnits.toList();
  convertToCodeUnits.shuffle(random);
  String newPassword = String.fromCharCodes(convertToCodeUnits);
  print(newPassword.substring(0, passwordLength));
}

// Write a program in Dart that find the area of a circle using function. Formula: pi * r * r
void findAreaOfCircle(double radius) {
  print(calculation.getAreaOfCircle(radius));
}

// Write a program in Dart to reverse a String using function.
void reverseString(String str) {
  print(str.split('').reversed.join(''));
}

// Write a program in Dart to calculate power of a certain number. For e.g 5^3=125
void calculatePower(int base, int exponent) {
  print(pow(base, exponent));
}

// Write a function in Dart named add that takes two numbers as arguments and returns their sum.
void sum(int num1, int num2) {
  print(num1 + num2);
}

// Write a function in Dart called maxNumber that takes three numbers as arguments and returns the largest number.
void maxNumber(int num1, int num2, int num3) {
  print(max(num1, max(num2, num3)));
}

// Write a function in Dart called isEven that takes a number as an argument and returns True if the number is even, and False otherwise.
void isEven(int num) {
  if (num % 2 == 0) {
    print(true);
  } else {
    print(false);
  }
}

// Write a function in Dart called createUser with parameters name, age, and isActive, where isActive has a default value of true.
void createUser(String name, int age, [bool isActive = true]) {
  print("Name: $name");
  print("Age: $age");
  print("isActive: ${isActive ? 'true' : 'false'}");
}

// Write a function in Dart called calculateArea that calculates the area of a rectangle. It should take length and width as arguments, with a default value of 1 for both. Formula: length * width.
void calculateArea([double length = 1, double width = 1]) {
  print(calculation.getArea(length, width));
}
