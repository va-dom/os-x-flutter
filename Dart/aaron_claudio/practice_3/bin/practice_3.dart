import 'dart:io';
import 'package:practice_3/practice_3.dart' as practice_3;

void main(List<String> arguments) {
  
  print('-------------------Practice Question 3-------------------');
  
  //Question 1
  print('1. Write a program in Dart to print your own name using function.');
  print(practice_3.myName());

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 2
  print('2. Write a program in Dart to print even numbers between intervals using function.');
  print('Enter first number:');
  int num1 = int.parse(stdin.readLineSync()!);
  print('Enter second number:');
  int num2 = int.parse(stdin.readLineSync()!);
  print(practice_3.getEvenNumbers(num1, num2));

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 3
  print('3. Create a function called greet that takes a name as an argument and prints a greeting message. For example, greet(“John”) should print “Hello, John”.');
  print(practice_3.greet("John"));

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 4
  print('4. Write a program in Dart that generates random password.');
  print('Generated password: ${practice_3.generatePassword()}');

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 5
  print('5. Write a program in Dart that find the area of a circle using function. Formula: pi * r * r');
  print('Enter the radius of the circle:');
  double r = double.parse(stdin.readLineSync()!);
  print('The area of a circle with a radius of $r is: ${practice_3.getArea(r)}');

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 6
  print('6. Write a program in Dart to reverse a String using function.');
  print('Enter some text:');
  String? txt = stdin.readLineSync()!;
  print('The reversed value of $txt is: ${practice_3.reverseString(txt)}');

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 7
  print('7. Write a program in Dart to calculate power of a certain number. For e.g 5^3=125');
  print('Enter base number:');
  num base = num.parse(stdin.readLineSync()!);
  print('Enter exponent:');
  num expnt = num.parse(stdin.readLineSync()!);
  print('$base ^ $expnt = ${practice_3.calculatePow(base, expnt)}');

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 8
  print('8. Write a function in Dart named add that takes two numbers as arguments and returns their sum.');
  print('Enter base number:');
  int num4 = int.parse(stdin.readLineSync()!);
  print('Enter exponent:');
  int num5 = int.parse(stdin.readLineSync()!);
  print('The sum of $num4 and $num5 is: ${practice_3.add(num4, num5)}');

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 9
  print('9. Write a function in Dart called maxNumber that takes three numbers as arguments and returns the largest number.');
  print('Enter first number:');
  int num6 = int.parse(stdin.readLineSync()!);
  print('Enter second number:');
  int num7 = int.parse(stdin.readLineSync()!);
  print('Enter third number:');
  int num8 = int.parse(stdin.readLineSync()!);
  print('The largest number between $num6, $num7, and $num8 is: ${practice_3.maxNumber(num6, num7, num8)}');

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 10
  print('10. Write a function in Dart called isEven that takes a number as an argument and returns True if the number is even, and False otherwise.');
  print('Enter number:');
  int num9 = int.parse(stdin.readLineSync()!);
  print('Is $num9 an even number? ${practice_3.isEven(num9)}');

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 11
  print('11. Write a function in Dart called createUser with parameters name, age, and isActive, where isActive has a default value of true.');
  print('Enter your Name');
  String name = stdin.readLineSync()!;
  print('Enter your age');
  int age = int.parse(stdin.readLineSync()!);
  Map<String, dynamic> user1 = practice_3.createUser(name, age);
  print('User successfully created.');
  print('Name: ${user1['name']}');
  print('Age: ${user1['age']}');
  print('IsActive: ${user1['isActive']}');

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 12
  print('12. Write a function in Dart called calculateArea that calculates the area of a rectangle. It should take length and width as arguments, with a default value of 1 for both. Formula: length * width.');
  print('Enter length:');
  double length = double.parse(stdin.readLineSync()!);
  print('Enter width:');
  double width = double.parse(stdin.readLineSync()!);
  print('The area of a reactangle with length of $length and width of $width is: ${practice_3.calculateArea(length, width)}');
}
