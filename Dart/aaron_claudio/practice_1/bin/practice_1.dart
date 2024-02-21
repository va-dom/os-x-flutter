import 'dart:io';
import 'package:practice_1/practice_1.dart' as practice_1;

void main(List<String> arguments) {
  print('-------------------Practice Question 1-------------------');
  //Question 1
  print('1. Write a program to print your name in Dart.');
  print(practice_1.myName());

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 2
  print("2.a. Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.");
  print(practice_1.hello1());
  print("\n2.b. Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.");
  print(practice_1.hello2());

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 3
  print('3. Declare constant type of int set value 7.');
  print(practice_1.constNum());

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 4
  print('4. Write a program in Dart that finds simple interest. Formula= (p * t * r) / 100');
  print("Interest: ${practice_1.getInterest()}");

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 5
  print('5. Write a program to print a square of a number using user input.');
  print("Enter a number:");
  int? number = int.parse(stdin.readLineSync()!);
  print("The square root of $number is ${practice_1.getSquareRoot(number)}");
  

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 6
  print('6. Write a program to print full name of a person from first name and last name using user input.');
  print('Enter your first name:');
  String firstName = stdin.readLineSync()!;
  print('Enter your last name:');
  String lastName = stdin.readLineSync()!;
  print('Full name: ${practice_1.getFullName(firstName, lastName)}');

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 7
  print('7. Write a program to find quotient and remainder of two integers.');
  print('Enter first number:');
  int? num1 = int.parse(stdin.readLineSync()!);
  print('Enter second number:');
  int? num2 = int.parse(stdin.readLineSync()!);
  print('The modulus of $num1 and $num2 is ${practice_1.getRemainder(num1, num2)}');
  print('The quotient of $num1 and $num2 is ${practice_1.getQuotient(num1, num2)}');

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 8
  print('8. Write a program to swap two numbers.');
  print("The 2 numbers you entered are: $num1 and $num2");
  int temp = num1;
  num1 = num2;
  num2 = temp;
  print('After swapping, the first number : $num1, the second number: $num2.');

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 9
  print('9. Write a program in Dart to remove all whitespaces from String.');
  print('Enter some text with whitespaces:');
  String? str1 = stdin.readLineSync();
  print(practice_1.reverseText(str1));

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 10
  print('10. Write a Dart program to convert String to int.');
  String strNum = "120";
  int num = int.parse(strNum);
  print("Converting string '120' to int: $num");

  print("\n---------------------------------------------------------------------------------------------------------------\n");
  
  //Question 11
  print('11. Write a program to calculate split amount of bill');
  print("Enter the bill amaount");
  double? amount = double.parse(stdin.readLineSync()!);//1500.00
  print("Enter number of pax");
  int? pax = int.parse(stdin.readLineSync()!);//5
  print('The bill amounting to $amount will be splitted into ${practice_1.splitBill(amount, pax)} per person');

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  //Question 12
  print('12. Write a program to calculate time taken to reach office in minutes.');
  print("Enter distance:");
  int? distance = int.parse(stdin.readLineSync()!);//25;
  print("Enter speed:");
  int? speed = int.parse(stdin.readLineSync()!);//40;
  print('The distance to office from your home is $distance, in a speed of $speed km per hour, you will arrive in just ${practice_1.calculateTime(distance, speed)} minutes.');
}
