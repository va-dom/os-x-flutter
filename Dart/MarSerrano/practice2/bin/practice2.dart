import 'package:practice2/practice2.dart' as practice2;
import 'dart:io';

void main(List<String> arguments) {
  //Question 1
  print("==================Question 1==================");
  print("Write a dart program to check if the number is odd or even.");
  print("Enter a number:");
  int num = int.parse(stdin.readLineSync()!);
  if(num%2 == 0) {
    print("Your number is an even number.");
  }
  else {
    print("Your number is an odd number.");
  }

  //Question 2
  print("==================Question 2==================");
  print("Write a dart program to check whether a character is a vowel or consonant.");
  print("Enter a character:");
  String? char = stdin.readLineSync();
  if(char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u' ) {
    print("Your character is a vowel.");
  }
  else {
    print("Your character is a consonant.");
  }
  
  //Question 3
  print("==================Question 3==================");
  print("Write a dart program to check whether a number is positive, negative, or zero.");
  print("Enter a number:");
  int num1 = int.parse(stdin.readLineSync()!);
  if(num1 == 0) {
    print("Your number is a zero.");
  }
  else if (num1 > 0) {
    print("Your number is positive.");
  }
  else {
    print("Your number is negative.");
  }
  
  //Question 4
  print("==================Question 4==================");
  print("Write a dart program to print your name 100 times.");
  String name = "Mar";
  for(int i = 0; i < 100; i++) {
    print("${i+1} $name");
  }
  //Question 5
  print("==================Question 5==================");
  print("Write a dart program to calculate the sum of natural numbers.");
  print("Enter a natural number:");
  int n = int.parse(stdin.readLineSync()!);
  int sum = 0;
  for(int i = 0; i <= n; i++) {
    sum = sum + i;
  }
  print("Sum of all natural numbers: $sum");

  //Question 6
  print("==================Question 6==================");
  print("Write a dart program to generate multiplication tables of 5.");
  print("Multiplication Table of 5:");
  for(int i = 1; i <=10; i++) {
    print("${i*5}");
  }

  //Question 7
  print("==================Question 7==================");
  print("Write a dart program to generate multiplication tables of 1-9.");
  print("Enter a number from 1-9:");
  int x = int.parse(stdin.readLineSync()!);
  if( x < 1 || x > 9){
    print("Invalid input.");
  }
  else {
    print("Multiplication Table of $x:");
    for(int i = 1; i <=10; i++) {
      print("${i*x}");
    }
  }

  //Question 8
  print("==================Question 8==================");
  print("Write a dart program to create a simple calculator that performs addition, subtraction, multiplication, and division.");
  print("Enter first number:");
  int num2 = int.parse(stdin.readLineSync()!);
  print("Enter second number:");
  int num3 = int.parse(stdin.readLineSync()!);
  String message = '''Select an operation:
  a. Addition
  b. Subtraction
  c. Multiplication
  d. Division ''';
  print(message);
  String? operation = stdin.readLineSync();
  switch(operation) {
    case 'a':
      print("Sum: ${num2 + num3}");
      break;
    case 'b':
      print("Difference: ${num2 - num3}");
      break;
    case 'c':
      print("Product: ${num2 * num3}");
      break;
    case 'd':
      print("Quotient: ${num2/num3}");
      break;
    default:
      print("Invalid Operation");
      break;
  }

  //Question 9
  print("==================Question 9==================");
  print("Write a dart program to print 1 to 100 but not 41.");
  int y = 1;
  while(y <= 100) {
    if(y == 41) {
      y++;
      continue;
    }
    print(y);
    y++;
  }
}
