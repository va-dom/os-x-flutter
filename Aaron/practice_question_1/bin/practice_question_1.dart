import 'package:practice_question_1/practice_question_1.dart' as practice_question_1;
import 'dart:io';

void main(List<String> arguments) {
  print('-------------------Practice Question 1-------------------');
  print('1. Write a program to print your name in Dart.');
  print('${practice_question_1.myName()}');
  print("2.a. Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.");
  print('${practice_question_1.hello1()}');
  print("2.b. Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.");
  print('${practice_question_1.hello2()}');
  print('3. Declare constant type of int set value 7.');
  print('${practice_question_1.constNum()}');
  print('4. Write a program in Dart that finds simple interest. Formula= (p * t * r) / 100');
  print('${practice_question_1.getInterest()}');
  print('5. Write a program to print a square of a number using user input.');
  print("Enter number:");
  int? number = int.parse(stdin.readLineSync()!);
  for(int i = 0; i <= number; i++){
    for(int j = 0; j <= number; j++){
      stdout.write('$j ');
    }
    print('');
  }
}
