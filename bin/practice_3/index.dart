import '../practice_1/index.dart' as p1;
import 'dart:math';

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
  int intRange = 26;
  Random random = Random();
  List<int> password =
      List.generate(passwordLength, (_) => random.nextInt(intRange) + 97);

  final passwordString = String.fromCharCodes(password).toUpperCase();

  print(passwordString);
}

// Write a program in Dart that find the area of a circle using function. Formula: pi * r * r
void findAreaOfCircle(double radius) {
  double area = pi * radius * radius;
  print(area);
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
void add(int num1, int num2) {
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
  print("isActive: $isActive");
}

// Write a function in Dart called calculateArea that calculates the area of a rectangle. It should take length and width as arguments, with a default value of 1 for both. Formula: length * width.
void calculateArea([int length = 1, int width = 1]) {
  print(length * width);
}
