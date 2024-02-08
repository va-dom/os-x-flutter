import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  // Question 1
  print("1. Write a program to print your name in Dart.");
  print(myName());

  // Question 2
  print("2. Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.");
  print(helloJohnDoe1());
  print(helloJohnDoe2());

  // Question 3
  print("Declare constant type of int set value 7.");
  print(declareConstant());

  // Question 4
  print("Write a program in Dart that finds simple interest. Formula= (p * t * r) / 100");
  print(calculateSimpleInterest(5000, 10, 2));

  // Question 5
  print("Write a program to print a square of a number using user input.");
  powerOfNumber();

  // Question 6
  print("Write a program to print full name of a from first name and last name using user input.");
  fullNameInput();

  // Question 7
  print("Write a program to find quotient and remainder of two integers.");
}


String myName() {
  String name = "Vole Aggabao";
  return name;
}

String helloJohnDoe1() {
  String name = "John Doe";
  return "Hello I am \"$name\"";
}

String helloJohnDoe2() {
  String name = "John Doe";
  return 'Hello I\'m "$name"';
}

int declareConstant() {
  const int value = 7;
  return value;
}

double calculateSimpleInterest(double p, double t, double r) {
  return (p * t * r) / 100;
}

void powerOfNumber() {
  print("Enter number:");
  double number = double.parse(stdin.readLineSync()!);
  num numberSq = pow(number, 2);
  print("The square of $number is $numberSq");
}

void fullNameInput() {
  print("Enter first name:");
  String? firstName = stdin.readLineSync();
  print("Enter last name:");
  String? lastName = stdin.readLineSync();
  print("Name: $firstName $lastName");
}