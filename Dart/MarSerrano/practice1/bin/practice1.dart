import 'package:practice1/practice1.dart' as practice1;
import 'dart:io';

void main() {
  //Question 1
  print("==================Question 1==================");
  print("Write a program to print your name in Dart.");
  String myName = "Mar Christian Serrano";
  print("Hello, my name is $myName.");

  //Question 2
  print("==================Question 2==================");
  print('''Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.''');
  String text1 = 'Hello I am "John Doe"';
  String text2 = '''Hello I'am "John Doe"''';
  print(text1);
  print(text2);

  //Question 3
  print("==================Question 3==================");
  print("Declare constant type of int set value 7.");
  const value = 7;
  print("Constant Value: $value");

  //Question 4
  print("==================Question 4==================");
  print('''Write a program in Dart that finds simple interest. Formula= (p * t * r) / 100 ''');
  print("Enter p: ");
  int? p = int.parse(stdin.readLineSync()!);
  print("Enter t: ");
  int? t = int.parse(stdin.readLineSync()!);
  print("Enter r: ");
  int? r = int.parse(stdin.readLineSync()!);
  double interest = (p*t*r)/100;
  print("Interest : $interest");

  //Question 5
  print("==================Question 5==================");
  print("Write a program to print a square of a number using user input.");
  print("Enter a number: ");
  int? number = int.parse(stdin.readLineSync()!);
  print("$number squared is ${number*number}");

  //Question 6
  print("==================Question 6==================");
  print('''Write a program to print full name from first name and last name using user input. ''');
  print("Enter your First Name:");
  String? firstName = stdin.readLineSync();
  print("Enter your Last Name:");
  String? lastName = stdin.readLineSync();
  print("Full Name : $firstName $lastName");

  //Question 7
  print("==================Question 7==================");
  print("Write a program to find quotient and remainder of two integers.");
  print("Enter first number:");
  int? num1 = int.parse(stdin.readLineSync()!);
  print("Enter second number:");
  int? num2 = int.parse(stdin.readLineSync()!);
  int quotient = num1~/num2;
  int remainder = num1%num2;
  print("$num1 divided by $num2 is $quotient remainder $remainder");

  //Question 8
  print("==================Question 8==================");
  print("Write a program to swap two numbers.");
  print("Enter Number1: ");
  int? number1 = int.parse(stdin.readLineSync()!);
  print("Enter Number2: ");
  int? number2 = int.parse(stdin.readLineSync()!);
  int tempNum = number1;
  number1 = number2;
  number2 = tempNum;
  print("Your number swapped is Number1 : $number1 and Number2 : $number2");

  //Question 9
  print("==================Question 9==================");
  print("Write a program in Dart to remove all whitespaces from String.");
  String withWhiteSpaces = "This string has white spaces previously.";
  print(withWhiteSpaces.replaceAll(" ",""));

  //Question 10
  print("==================Question 10==================");
  print("Write a Dart program to convert String to int.");
  String numString = "3";
  int stringToNum = int.parse(numString);
  print("$stringToNum is a variable type ${stringToNum.runtimeType}");

  //Question 11
  print("==================Question 11==================");
  print('''Suppose, you often go to restaurant with friends and you have to split amount of bill. Write a program to calculate split amount of bill. Formula= (total bill amount) / number of people''');
  print("Enter your bill:");
  double bill = double.parse(stdin.readLineSync()!);
  print("Enter number of people:");
  int numOfPeople = int.parse(stdin.readLineSync()!);
  double amount = bill/numOfPeople;
  print("Each of you will pay ${amount.toStringAsFixed(2)}");

  //Question 12
  print("==================Question 12==================");
  print('''Suppose, your distance to office from home is 25 km and you travel 40 km per hour. Write a program to calculate time taken to reach office in minutes. Formula= (distance) / (speed)''');
  int distance = 25;
  int speed = 40;
  double timeInMinutes = (distance/speed)*60;
  print("You will reach your office in $timeInMinutes minutes.");
}
