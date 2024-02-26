import 'dart:math';

import 'package:practice7/practice7.dart' as practice7;

class Address {
  late String address;

  void printAddress() {
    print("Address : $address");
  }
}

void printNum(int? number) => print("Number: ${number ?? 0}");

int? generateRandom() => Random().nextBool() ? 100 : null;

void main(List<String> arguments) {
  //Question 1
  print("==================Question 1==================");
  print("What is the purpose of the ? operator in Dart null safety?");
  print("'?' operator declares that a variable is nullable.");

  //Question 2
  print("==================Question 2==================");
  print("Create a late variable named address, assign a US value to it and print it.");
  Address add1 = Address();
  add1.address = "US";
  add1.printAddress();

  //Question 3
  print("==================Question 3==================");
  print("How do you declare a nullable type in Dart null safety?");
  print("You can decalare a nullable type by typing '?' after the data type (e.g. int?)");

  //Question 4
  print("==================Question 4==================");
  print("Write a program in a dart to create an age variable and assign a null value to it using ?.");
  int? age;
  age = null;
  print("Age: $age");

  //Question 5
  print("==================Question 5==================");
  print("Write a function that accepts a nullable int parameter and returns 0 if the value is null using null coalescing operator ??.");
  printNum(2);
  printNum(null);

  //Question 6
  print("==================Question 6==================");
  print('''Write a function named generateRandom() in dart that randomly returns 100 or null. 
  Also, assign a return value of the function to a variable named status that can’t be null. 
  Give status a default value of 0, if generateRandom() function returns null.''');
  int? status = generateRandom() ?? 0;
  print("Status : $status");
}
