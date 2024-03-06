import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  // Question 1
  print("1. Write a program to print your name in Dart.");
  question1();

  // Question 2
  print("----------------------");
  print("2. Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.");
  question2();

  // Question 3
  print("----------------------");
  print("3. Declare constant type of int set value 7.");
  question3();

  // Question 4
  print("----------------------");
  print("4. Write a program in Dart that finds simple interest. Formula= (p * t * r) / 100");
  question4();

  // Question 5
  print("----------------------");
  print("5. Write a program to print a square of a number using user input.");
  question5();

  // Question 6
  print("----------------------");
  print("6. Write a program to print full name of a from first name and last name using user input.");
  question6();

  // Question 7
  print("----------------------");
  print("7. Write a program to find quotient and remainder of two integers.");
  question7();

  // Question 8
  print("----------------------");
  print("8. Write a program to swap two numbers.");
  question8();
  
  // Question 9
  print("----------------------");
  print("9. Write a program in Dart to remove all whitespaces from String.");
  question9();

  // Question 10
  print("----------------------");
  print("10. Write a Dart program to convert String to int.");
  question10();

  // Question 11
  print("----------------------");
  print("11. Suppose, you often go to restaurant with friends and you have to split amount of bill. Write a program to calculate split amount of bill. Formula= (total bill amount) / number of people");
  question11();

  // Question 12
  print("----------------------");
  print("12. Suppose, your distance to office from home is 25 km and you travel 40 km per hour. Write a program to calculate time taken to reach office in minutes. Formula= (distance) / (speed)");
  question12();
}

void question1() {
  String name = "Vole Aggabao";
  print(name);
}

void question2(){
  String name = "John Doe";
  print("Hello I am \"$name\"");
  print('Hello I\'m "$name"');
}


void question3() {
  const int value = 7;
  print("Declared constant: $value");
}

void question4() {
  double p = 5000;
  double t = 10;
  double r = 2;
  double simpleInterest = (p * t * r) / 100;
  print("Simple interest is $simpleInterest");
}

void question5() {
  print("Enter number:");
  double number = double.parse(stdin.readLineSync()!);
  num numberSq = pow(number, 2);
  print("The square of $number is $numberSq");
}

void question6() {
  print("Enter first name:");
  String? firstName = stdin.readLineSync();
  print("Enter last name:");
  String? lastName = stdin.readLineSync();
  print("Name: $firstName $lastName");
}

void question7() {
  int num1 = 10;
  int num2 = 3;
  int quotient = num1 ~/ num2;
  int remainder = num1 % num2; 
  print("$num1 / $num2 = $quotient");
  print("$num1 % $num2 = $remainder");
}

void question8() {
  int a = 10;
  int b = 6;
  print("a = $a");
  print("b = $b");
  a = a - b;
  b = a + b;
  a = b - a;
  print("Swapping a and b");
  print("a = $a");
  print("b = $b");
}

void question9() {
  String text = "9. Write a program in Dart to remove all whitespaces from String.";
  print(text.replaceAll(' ', ''));
}

void question10() {
  String value = "10";
  int intValue = int.parse(value);
  print("Current type of $value: ${value.runtimeType}");
  print("Converted type of $intValue: ${intValue.runtimeType}");
}

void question11() {
  print("Enter total bill amount");
  double billAmount = double.parse(stdin.readLineSync()!);
  print("Enter number of people");
  int peopleCount = int.parse(stdin.readLineSync()!);
  double splitAmount = billAmount / peopleCount;
  print("Split amount = ${splitAmount.toStringAsFixed(2)}");
}

void question12() {
  double distance = 25;
  double speed = 40;
  print("ETA: ${distance / speed}");
}