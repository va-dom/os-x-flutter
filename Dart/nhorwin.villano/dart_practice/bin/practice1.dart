import 'dart:io';

//test
void main() {
  print("---------------------------------------------------");
  print("Questions for Practice 1");
  print("---------------------------------------------------");

  print("1. Write a program to print your name in Dart.");
  print("My name is Nhorwin Villano");
  print("\n");

  print(
      "2. Write a program to print Hello I am “John Doe” and Hello I'am “John Doe” with single and double quotes.");
  print('Hello I am "John Doe"');
  print("Hello I'am " + '"John Doe"');
  print("\n");

  print("3. Declare constant type of int set value 7.");
  const int value = 7;
  print("Constant value is $value");
  //value = 8; this is not possible
  print("\n");

  print(
      "4. Write a program in Dart that finds simple interest. Formula= (p * t * r) / 100");
  print("Enter the value of p: ");
  int? p = int.parse(stdin.readLineSync()!);
  print("Enter the value of t: ");
  int? t = int.parse(stdin.readLineSync()!);
  print("Enter the value of r: ");
  int? r = int.parse(stdin.readLineSync()!);
  double interest = (p * t * r) / 100;
  print("The simple interest is $interest");
  print("\n");

  print("5. Write a program to print a square of a number using user input.");
  print("Enter a Number: ");
  int? number = int.parse(stdin.readLineSync()!);
  int square = number * number;
  print("The square of $number is $square");
  print("\n");

  print(
      "6. Write a program to print full name of a from first name and last name using user input.");
  print("Enter a Firstname: ");
  String? firstName = stdin.readLineSync();
  print("Enter a Lastname: ");
  String? lastName = stdin.readLineSync();
  print("The full name is  $firstName $lastName");
  print("\n");

  print("7. Write a program to find quotient and remainder of two integers.");
  print("Enter a Dividend: ");
  int? dividend = int.parse(stdin.readLineSync()!);
  print("Enter a Divisor: ");
  int? divisor = int.parse(stdin.readLineSync()!);
  int quotient = dividend ~/ divisor;
  int remainder = dividend % divisor;
  print("The quotient is  $quotient");
  print("The remainder is  $remainder");
  print("\n");

  print("8. Write a program to swap two numbers..");
  int number1 = 9;
  int number2 = 1;
  int temp_number;
  print("Before swapping");
  print("1st Number : $number1");
  print("2nd Number : $number2");
  temp_number = number1;
  number1 = number2;
  number2 = temp_number;
  print("After swapping");
  print("1st Number : $number1");
  print("2nd Number : $number2");
  print("\n");

  print("9. Write a program in Dart to remove all whitespaces from String.");
  String name = "   Nhorwin Villano";
  print("With whitespaces");
  print(name);
  print("Without whitespaces");
  print(name.trim());
  print("\n");

  print("10. Write a Dart program to convert String to int.");
  String number_text = "100";
  int num = int.parse(number_text);
  print(num + 1);
  print("\n");

  print(
      "11. Suppose, you often go to restaurant with friends and you have to split amount of bill. Write a program to calculate split amount of bill..");
  print("Enter the Total amount of bill: ");
  double? totalAmountBill = double.parse(stdin.readLineSync()!);
  print("Enter the Total number of people: ");
  int? numberOfPeople = int.parse(stdin.readLineSync()!);
  double splittedBill = (totalAmountBill) / numberOfPeople;
  print("The bill per person is $splittedBill");
  print("\n");

  print(
      "12. Suppose, your distance to office from home is 25 km and you travel 40 km per hour. Write a program to calculate time taken to reach office in minutes.");
  print("Enter Distance(km): ");
  int? distance = int.parse(stdin.readLineSync()!);
  print("Enter Speed(km/h): ");
  int? speed = int.parse(stdin.readLineSync()!);
  double time = ((distance) / speed) * 60;
  print("The time taken to reach office in minutes is $time");
  print("\n");
}
