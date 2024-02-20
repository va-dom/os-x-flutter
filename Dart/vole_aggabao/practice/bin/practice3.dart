import 'dart:io';
import 'package:practice/practice3_lib.dart' as practice3_lib;

void main(List<String> arguments) {
  print("-----------------------------------------------------------------");
  print(" Questions for Practice 3");
  print(" [1] Write a program in Dart to print your own name using function.");
  print(" [2] Write a program in Dart to print even numbers between intervals using function.");
  print(" [3] Create a function called greet that takes a name as an argument and prints a greeting message. For example, greet(“John”) should print “Hello, John”.");
  print(" [4] Write a program in Dart that generates random password.");
  print(" [5] Write a program in Dart that find the area of a circle using function. Formula: pi * r * r");
  print(" [6] Write a program in Dart to reverse a String using function.");
  print(" [7] Write a program in Dart to calculate power of a certain number. For e.g 5^3=125");
  print(" [8] Write a function in Dart named add that takes two numbers as arguments and returns their sum.");
  print(" [9] Write a function in Dart called maxNumber that takes three numbers as arguments and returns the largest number.");
  print(" [10] Write a function in Dart called isEven that takes a number as an argument and returns True if the number is even, and False otherwise.");
  print(" [11] Write a function in Dart called createUser with parameters name, age, and isActive, where isActive has a default value of true.");
  print(" [12] Write a function in Dart called calculateArea that calculates the area of a rectangle. It should take length and width as arguments, with a default value of 1 for both. Formula: length * width.");
  print("-----------------------------------------------------------------");
  print("Select a Question");
  String choice = stdin.readLineSync()!;
  switch (choice) {
    case "1":
      question1();
      break;
    case "2":
      question2();
      break;
    case "3":
      question3();
      break;
    case "4":
      question4();
      break;
    case "5":
      question5();
      break;
    case "6":
      question6();
      break;
    case "7":
      question7();
      break;
    case "8":
      question8();
      break;
    case "9":
      question9();
      break;
    case "10":
      question10();
      break;
    case "11":
      question11();
      break;
    case "12":
      question12();
      break;
    default:
      print("Invalid input! Choice is not in the options!!");
  }
}

void question1() {
  print(" [1] Write a program in Dart to print your own name using function.");
  print(practice3_lib.getName());
}

void question2() {
  print(" [2] Write a program in Dart to print even numbers between intervals using function.");
  print("Enter a number range (e.g. 1-20)");
  String? numRange = stdin.readLineSync();
  if (numRange != null) {
    List<String> numRangeList = numRange.split('-');
    if (numRangeList.length < 2 || numRangeList.length > 2) {
      print("Invalid number range");
    } else {
      if (!practice3_lib.isNumeric(numRangeList[0]) || !practice3_lib.isNumeric(numRangeList[1])) {
        print("Invalid number range");
      } else {
        int num1 = int.parse(numRangeList[0]);
        int num2 = int.parse(numRangeList[1]);
        print(practice3_lib.getEvenNumbersInRange(num1, num2));
      }
    }
  }
}

void question3() {
  print(" [3] Create a function called greet that takes a name as an argument and prints a greeting message. For example, greet(“John”) should print “Hello, John”.");
  String? name = stdin.readLineSync();
  if (name != null) {
    practice3_lib.printGreeting(name);
  }
}

void question4() {
  print(" [4] Write a program in Dart that generates random password.");
  print("Enter password length");
  int passLength = int.parse(stdin.readLineSync()!);
  print("Generated Password: ${practice3_lib.generatePassword(length: passLength)}");
}

void question5() {
  print(" [5] Write a program in Dart that find the area of a circle using function. Formula: pi * r * r");
  print("Enter Radius");
  double r = double.parse(stdin.readLineSync()!);
  print("Area = ${practice3_lib.getCircleArea(r)}");
}

void question6() {
  print(" [6] Write a program in Dart to reverse a String using function.");
  String text = " [6] Write a program in Dart to reverse a String using function.";
  print("Reversed Text: ${practice3_lib.reverseText(text)}");
}

void question7() {
  print(" [7] Write a program in Dart to calculate power of a certain number. For e.g 5^3=125");
  print("Number");
  int num = int.parse(stdin.readLineSync()!);
  print("Exponent");
  int exponent = int.parse(stdin.readLineSync()!);
  print("$num ^ $exponent = ${practice3_lib.getPower(num, exponent)}");
}

void question8() {
  print(" [8] Write a function in Dart named add that takes two numbers as arguments and returns their sum.");
  print("Enter number 1");
  num num1 = num.parse(stdin.readLineSync()!);
  print("Enter number 2");
  num num2 = num.parse(stdin.readLineSync()!);
  print("$num1 + $num2 = ${practice3_lib.add(num1, num2)}");
}

void question9() {
  print(" [9] Write a function in Dart called maxNumber that takes three numbers as arguments and returns the largest number.");
  int num1 = 76;
  int num2 = 99;
  int num3 = -16;
  print("Largest number is ${practice3_lib.maxNumber(num1, num2, num3)}");
}

void question10() {
  print(" [10] Write a function in Dart called isEven that takes a number as an argument and returns True if the number is even, and False otherwise.");
  int num = 73;
  print("$num is Even: ${practice3_lib.isEven(num)}");
}

void question11() {
  print(" [11] Write a function in Dart called createUser with parameters name, age, and isActive, where isActive has a default value of true.");
  print("Fill out the required information");
  print("Name");
  String name = stdin.readLineSync()!;
  print("Age");
  int age = int.parse(stdin.readLineSync()!);
  print(practice3_lib.createUser(name, age));
}

void question12() {
  print(" [12] Write a function in Dart called calculateArea that calculates the area of a rectangle. It should take length and width as arguments, with a default value of 1 for both. Formula: length * width.");
  print("Length");
  num length = num.parse(stdin.readLineSync()!);
  print("Width");
  num width = num.parse(stdin.readLineSync()!);
  print("Area = ${practice3_lib.calculateArea(length: length, width: width)}");
}