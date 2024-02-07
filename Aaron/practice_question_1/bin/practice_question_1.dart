import 'package:practice_question_1/practice_question_1.dart' as practice_question_1;
import 'dart:io';

void main(List<String> arguments) {
  print('-------------------Practice Question 1-------------------');
  //Question 1
  print('1. Write a program to print your name in Dart.');
  print(practice_question_1.myName());

  //Question 2
  print("2.a. Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.");
  print(practice_question_1.hello1());
  print("2.b. Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.");
  print(practice_question_1.hello2());

  //Question 3
  print('3. Declare constant type of int set value 7.');
  print(practice_question_1.constNum());

  //Question 4
  print('4. Write a program in Dart that finds simple interest. Formula= (p * t * r) / 100');
  print(practice_question_1.getInterest());

  //Question 5
  print('5. Write a program to print a square of a number using user input.');
  print("Enter number:");
  int? number = int.parse(stdin.readLineSync()!);
  for(int i = 0; i <= number; i++){
    for(int j = 0; j <= number; j++){
      stdout.write('$number ');
    }
    print('');
  }

  //Question 6
  print('6. Write a program to print full name of a from first name and last name using user input.');
  print('Enter your first name:');
  String? firstName = stdin.readLineSync();
  print('Enter your last name:');
  String? lastName = stdin.readLineSync();
  print('Hello $firstName $lastName');

  //Question 7
  print('7. Write a program to find quotient and remainder of two integers.');
  print('Enter first number:');
  int? num1 = int.parse(stdin.readLineSync()!);
  print('Enter second number:');
  int? num2 = int.parse(stdin.readLineSync()!);
  print('The modulus is ${practice_question_1.getRemainder(num1, num2)}');
  print('The quotient is ${practice_question_1.getQuotient(num1, num2)}');

  //Question 8
  print('8. Write a program to swap two numbers.');
  int temp = num1;
  num1 = num2;
  num2 = temp;
  print('After swapping, the first number : $num1, the second number: $num2.');

  //Question 9
  print('9. Write a program in Dart to remove all whitespaces from String.');
  print('Enter some text with whitespaces:');
  String? str1 = stdin.readLineSync();
  print(str1.toString().replaceAll(' ', ''));

  //Question 10
  print('10. Write a Dart program to convert String to int.');
  String strNum = "120";
  int num = int.parse(strNum);
  print("Converting string '120' to int: $num");
  
  //Question 11
  print('11. Write a program to calculate split amount of bill');
  double amount = 1500.00;
  int pax = 5;
  double split = (amount) / pax;
  print('The bill amounting to $amount will be splitted into $split per person');

  //Question 12
  print('12. Write a program to calculate time taken to reach office in minutes.');
  int distance = 25;
  int speed = 40;
  double hours = (distance) / speed;
  double minutes = hours * 60;
  print('The distance to office from your home is $distance, in a speed of $speed km per hour, you will arrive in just $minutes minutes.');

}
