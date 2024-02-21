import 'dart:io';
import 'dart:math';

import 'package:practice3/practice3.dart' as practice3;

//function that prints my name
void printName () {
  print("Mar Serrano");
}

//function that finds even numbers between 2 numbers
void evenNumbers(int min, int max) {
  List<int> evenNums = [];

  for( int i = min+1; i < max; i++) {
    if(i%2 == 0) {
      evenNums.add(i);
    }
  }
  if(evenNums.isEmpty) {
    print("Even Numbers between $min and $max: None");
  }
  else {
    print("Even Numbers between $min and $max: ${evenNums.join(",")}");
  }

}

//function that print Hello + User input name
void greet(String? name) => print("Hello, $name");

//function that generate random password
void generatePassword() {
  List<String> randomPass = [];
  List<int> randomNums = List.generate(10, (_) => 33 + Random().nextInt(90));
  randomNums.forEach((number) {
    randomPass.add(String.fromCharCode(number));
  });
  print("Password: ${randomPass.join()}");
}

//function that find area of a circle
double findArea(double rad) {
  const pi = 3.14;
  return (pi*(pow(rad,2)));
}

//function that reverse string
String reverseString(String input) => input.split('').reversed.join();

//function that finds power of a number
num powerOf(int base, int exponent) => pow(base, exponent);

//function that add 2 numbers
double addNumbers(double num1, double num2) =>  num1 + num2;

//function that finds the max number between 3 numbers
void maxNumber(int firstNum, int secondNum, int thirdNum) {
  int tempMax = max(firstNum,secondNum);
  int maxNum = max(tempMax,thirdNum);
  print("Max Number: $maxNum");
}

//function that checks if a number is even or not
bool isEven(int x) => (x%2 == 0);

//function that create a user with details
void createUser(String? username, int age, [bool isActive = true]) => print("User $username created. Age: $age, Is Active: $isActive");

//function that calculate area of a rectangle
int calculateArea([int length = 1, int width = 1]) => length * width;

void main(List<String> arguments) {
  //Question 1
  print("==================Question 1==================");
  print("Write a program in Dart to print your own name using function.");
  printName();

  //Question 2
  print("==================Question 2==================");
  print("Write a program in Dart to print even numbers between intervals using function.");
  print("Enter min number:");
  int min = int.parse(stdin.readLineSync()!);
  print("Enter max number:");
  int max = int.parse(stdin.readLineSync()!);
  evenNumbers(min, max);

  //Question 3
  print("==================Question 3==================");
  print("Create a function called greet that takes a name as an argument and prints a greeting message. For example, greet(“John”) should print “Hello, John”.");
  print("What is your name: ");
  String? name = stdin.readLineSync();
  greet(name);

  //Question 4
  print("==================Question 4==================");
  print("Write a program in Dart that generates random password.");
  generatePassword();

  //Question 5
  print("==================Question 5==================");
  print("Write a program in Dart that find the area of a circle using function. Formula: pi * r * r");
  print("Enter radius of circle:");
  double rad = double.parse(stdin.readLineSync()!);
  double area = findArea(rad);
  print("The area of your circle is $area");

  //Question 6
  print("==================Question 6==================");
  print("Write a program in Dart to reverse a String using function.");
  print("Enter a string: ");
  String input = stdin.readLineSync() ?? "";
  print("Your string reversed: ${reverseString(input)}");

  //Question 7
  print("==================Question 7==================");
  print("Write a program in Dart to calculate power of a certain number. For e.g 5^3=125");
  print("Enter a base number:");
  int base = int.parse(stdin.readLineSync()!);
  print("Enter an exponent:");
  int exponent = int.parse(stdin.readLineSync()!);
  print("$base raised to the power of $exponent is ${powerOf(base, exponent)}");

  //Question 8
  print("==================Question 8==================");
  print("Write a function in Dart named add that takes two numbers as arguments and returns their sum.");
  print("Enter first number:");
  double num1 = double.parse(stdin.readLineSync()!);
  print("Enter second number:");
  double num2 = double.parse(stdin.readLineSync()!);
  print("Sum: ${addNumbers(num1, num2)}");  

  //Question 9
  print("==================Question 9==================");
  print("Write a function in Dart called maxNumber that takes three numbers as arguments and returns the largest number.");
  print("Enter first number:");
  int firstNum = int.parse(stdin.readLineSync()!);
  print("Enter second number:");
  int secondNum = int.parse(stdin.readLineSync()!);
  print("Enter third number:");
  int thirdNum = int.parse(stdin.readLineSync()!);
  maxNumber(firstNum, secondNum, thirdNum);

  //Question 10
  print("==================Question 10==================");
  print("Write a function in Dart called isEven that takes a number as an argument and returns True if the number is even, and False otherwise.");
  print("Enter a number:");
  int x = int.parse(stdin.readLineSync()!);
  print("Is Even: ${isEven(x)}");

  //Question 11
  print("==================Question 11==================");
  print("Write a function in Dart called createUser with parameters name, age, and isActive, where isActive has a default value of true.");
  print("Enter your name:");
  String? username = stdin.readLineSync();
  print("Enter your age:");
  int age = int.parse(stdin.readLineSync()!);
  print("Activate? (Y/N):");
  String? activeStatus = stdin.readLineSync();
  createUser(username, age, activeStatus == 'Y' || activeStatus == 'y');

  //Question 12
  print("==================Question 12==================");
  print('''Write a function in Dart called calculateArea that calculates the area of a rectangle. 
  It should take length and width as arguments, with a default value of 1 for both. Formula: length * width.''');
  print("Enter length:");
  int length = int.parse(stdin.readLineSync()!);
  print("Enter width:");
  int width = int.parse(stdin.readLineSync()!);
  print("Area : ${calculateArea(length, width)}");

  
}
