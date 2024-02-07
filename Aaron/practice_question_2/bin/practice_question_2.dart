import 'package:practice_question_2/practice_question_2.dart' as practice_question_2;
import 'dart:io';

void main(List<String> arguments) {
  
  print('-------------------Practice Question 2-------------------');
  //Question 1
  print('1. Write a dart program to check if the number is odd or even.');
  print('Enter a number:');
  int? num = int.parse(stdin.readLineSync()!);
  print(practice_question_2.isOddOrEven(num));

  //Question 2
  print('2. Write a dart program to check whether a character is a vowel or consonant.');
  print('Enter a single letter:');
  String? lttr = stdin.readLineSync();
  print(practice_question_2.isVowelOrConsonant(lttr.toString()));

  //Question 3
  print('3. Write a dart program to check whether a number is positive, negative, or zero.');
  print('Enter a number:');
  int? num1 = int.parse(stdin.readLineSync()!);
  print(practice_question_2.isPositiveOrNegative(num1));

  //Question 4
  print('4. Write a dart program to print your name 100 times.');
  String name = "Aaron Claudio";
  for(int i = 0; i < 100; i++){
    print(name);
  }

  //Question 5
  print('5. Write a dart program to calculate the sum of natural numbers.');
  print('Enter a number');
  int? num2 = int.parse(stdin.readLineSync()!);
  print('The sum of natural numbers is: ${practice_question_2.sumOfNaturalNumbers(num2)}');

  //Question 6
  print('6. Write a dart program to generate multiplication tables of 5.');
  int num3 = 5;
  int product;
  for(int i = 0; i <= 10; i++){
    product = num3 * i;
    print('$num3 * $i = $product');
  }

  //Question 7
  print('7. Write a dart program to generate multiplication tables of 1-9.');
  int product1;
  for(int i = 1; i < 10; i++){
    print('Multiplication Table of $i');
    for(int j = 0; j <= 10; j++){
      product1 = i * j;
      print('$i * $j = $product1');
    }
  }

  //Question 8
  print('8. Write a dart program to create a simple calculator that performs addition, subtraction, multiplication, and division.');
  print('Enter first number:');
  int? firstNumber = int.parse(stdin.readLineSync()!);
  print('Enter second number:');
  int? secondNumber = int.parse(stdin.readLineSync()!);
  print('The sum of $firstNumber and $secondNumber is: ${practice_question_2.add(firstNumber, secondNumber)}');
  print('The difference of $firstNumber and $secondNumber is: ${practice_question_2.subtract(firstNumber, secondNumber)}');
  print('The product of $firstNumber and $secondNumber is: ${practice_question_2.multiply(firstNumber, secondNumber)}');
  print('The quotient of $firstNumber and $secondNumber is: ${practice_question_2.divide(firstNumber, secondNumber)}');

  // Question 9
  print('9. Write a dart program to print 1 to 100 but not 41.');
  for(int i = 1; i <= 100; i++){
    if(i != 41){
      print(i);
    }
  }

}
