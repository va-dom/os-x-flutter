import 'dart:io';
import 'dart:math';

void printOwnName() {
  print("Nhorwin John Villano");
}

void greet(String name) {
  print("Hello $name");
}

int generateRandomPassword() {
  int password = Random().hashCode;
  return password;
}

void getCircleArea(double r) {
  const double pi = 3.14;
  double area = pi * r * r;
  print("The area is $area");
}

String reverseString(String str) {
  String reversed = '';
  for (int i = str.length - 1; i >= 0; i--) {
    reversed += str[i];
  }
  return reversed;
}

double calculatePower(double base, int exponent) {
  double result = 1;
  for (int i = 0; i < exponent.abs(); i++) {
    result *= base;
  }
  if (exponent < 0) {
    result = 1 / result;
  }
  return result;
}

int add(int num1, int num2) {
  return num1 + num2;
}

int getLargestNumber(int num1, int num2, int num3) {
  int maxnum = max(max(num1, num2), num3);
  return maxnum;
}

bool isEven(int num) {
  return (num % 2 == 0) ? true : false;
}

void createUser(String name, int age, {bool isActive = true}) {
  print("Name : $name");
  print("Age : $age");
  print("isActive : $isActive");
}

void calculateArea({int length = 1, int width = 1}) {
  print("Length : $length");
  print("Width : $width");
  int area = length * width;
  print("Area : $area");
}

void main() {
  print("---------------------------------------------------");
  print("Questions for Practice 3");
  print("---------------------------------------------------");

  print("1. Write a program in Dart to print your own name using function.");
  printOwnName();
  print("\n");

  print(
      "3. Create a function called greet that takes a name as an argument and prints a greeting message. ");
  greet("Nhorwin John");
  print("\n");

  print("4. Write a program in Dart that generates random password. ");
  print(generateRandomPassword());
  print("\n");

  print(
      "5. Write a program in Dart that find the area of a circle using function. ");
  print("r = 5");
  getCircleArea(5);
  print("\n");

  print("6. Write a program in Dart to reverse a String using function.");
  String originalString = 'Nhorwin';
  String reversedString = reverseString(originalString);
  print('Original String: $originalString');
  print('Reversed String: $reversedString');
  print("\n");

  print("7. Write a program in Dart to calculate power of a certain number.");
  print("Enter the value of base: ");
  double base = double.parse(stdin.readLineSync()!);
  print("Enter the value of exponent: ");
  int exponent = int.parse(stdin.readLineSync()!);
  print(calculatePower(base, exponent));
  print("\n");

  print(
      "8. Write a function in Dart named add that takes two numbers as arguments and returns their sum.");
  int number1 = 5;
  int number2 = 6;
  print("Number1 = $number1");
  print("Number2 = $number2");
  int sum = add(number1, number2);
  print("Sum = $sum");
  print("\n");

  print(
      "9. Write a function in Dart called maxNumber that takes three numbers as arguments and returns the largest number.");
  number1 = 5;
  number2 = 6;
  int number3 = 7;
  print("Number1 = $number1");
  print("Number2 = $number2");
  print("Number3 = $number3");
  int maxNum = getLargestNumber(number1, number2, number3);
  print("Largest Number = $maxNum");
  print("\n");

  print(
      "10. Write a function in Dart called isEven that takes a number as an argument and returns True if the number is even, and False otherwise.");
  number1 = 5;
  number2 = 6;
  print("Number1 = $number1");
  bool result = isEven(number1);
  print("$number1 : $result");
  print("Number2 = $number2");
  result = isEven(number2);
  print("$number2 : $result");
  print("\n");

  print(
      "11. Write a function in Dart called createUser with parameters name, age, and isActive, where isActive has a default value of true.");
  createUser("Nhorwin", 27);
  print("\n");

  print(
      "12. Write a function in Dart called calculateArea that calculates the area of a rectangle. It should take length and width as arguments, with a default value of 1 for both.");
  calculateArea(length: 3, width: 4);
  print("\n");
}
