import 'dart:io';
import 'dart:math';

import 'package:test/expect.dart';

void main(List<String> arguments) {
  print("------------------------------------------------------------------------------------------------------------------------------");
  print("| Questions for Practice 2                                                                                                   |");
  print("| [1] Write a dart program to check if the number is odd or even.                                                            |");
  print("| [2] Write a dart program to check whether a character is a vowel or consonant.                                             |");
  print("| [3] Write a dart program to check whether a number is positive, negative, or zero.                                         |");
  print("| [4] Write a dart program to print your name 100 times.                                                                     |");
  print("| [5] Write a dart program to calculate the sum of natural numbers.                                                          |");
  print("| [6] Write a dart program to generate multiplication tables of 5.                                                           |");
  print("| [7] Write a dart program to generate multiplication tables of 1-9.                                                         |");
  print("| [8] Write a dart program to create a simple calculator that performs addition, subtraction, multiplication, and division.  |");
  print("| [9] Write a dart program to print 1 to 100 but not 41.                                                                     |");
  print("------------------------------------------------------------------------------------------------------------------------------");
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
    default:
      print("Invalid input! Choice is not in the options!!");
  }
}

void question1() {
  print("Enter number:");
  int number = int.parse(stdin.readLineSync()!);
  if (number % 2 > 0) {
    print("Number: $number is Odd.");
  } else {
    print("Number: $number is Even.");
  }
}

void question2(){
  print("Enter a character:");
  String ch = stdin.readLineSync()!;
  String chLowerCase = ch.toLowerCase();
  if (chLowerCase == "a" || chLowerCase == "e" || chLowerCase == "i" || chLowerCase == "o" || chLowerCase == "u") {
    print("Character: $ch is a Vowel.");
  } else {
    print("Character: $ch is a Consonant.");
  }
}


void question3() {
  print("Enter number:");
  int number = int.parse(stdin.readLineSync()!);
  switch(number) {
    case < 0:
      print("Number: $number is Negative.");
    case > 0:
      print("Number: $number is Positive.");
    default:
      print("Number: $number is Zero.");
  }
}

void question4() {
  const String name = "John Doe";
  for(int i = 0; i < 100; i++) {
    print("${i + 1}) $name");
  }
}

void question5() {
  const List<num> numbers = [0, 5, -10, 24, 33, -87];
  double sum = 0;
  for (num number in numbers) {
    if (number > 0 && isInteger(number)) {
      sum += number;
    }
  }
  print("Sum of natural numbers in the list: $numbers is ${sum.toInt()}");
}

bool isInteger(num value) {
  return value is int || value == value.roundToDouble();
}

void question6() {
  for (int i = 0; i <= 10; i++) {
    print("5 x $i = ${5 * i}");
  }
}

void question7() {
  for (int i = 1; i <= 9; i++) {
    for (int j = 0; j <= 10; j++) {
      print("$i x $j = ${i * j}");
    }
  }
}

void question8() {
  print("Enter operand 1");
  num num1 = num.parse(stdin.readLineSync()!);
  print("Enter operator (+, -, * or x, /)");
  String operator = stdin.readLineSync()!;
  print("Enter operand 1");
  num num2 = num.parse(stdin.readLineSync()!);

  switch(operator) {
    case "+":
      print("Result: ${num1 + num2}");
    case "-":
      print("Result: ${num1 - num2}");
    case "*" || "x":
      print("Result: ${num1 * num2}");
    case "/":
      print("Result: ${num1 / num2}");
    default:
      print("Invalid Operator!!");
  }
}

void question9() {
  for(int i = 1; i <= 100; i++) {
    if (i != 41) {
      print(i);
    }
  }
}
