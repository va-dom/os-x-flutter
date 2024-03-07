import 'package:practice_app/practice_app.dart' as main_util;
import 'package:practice_app/practice_3.dart' as practice_three_utils;

void runPractice(){
  print("**************** EXERCISE 3 ****************\n");

  print("1. Write a program in Dart to print your own name using function.");
  main_util.printName(1);

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("2. Write a program in Dart to print even numbers between intervals using function.");
   main_util.printNumListWithException(toVal: 100, except: [41], evenOnly: true);

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("3. Create a function called greet that takes a name as an argument and prints a greeting message. For example, greet(“John”) should print “Hello, John”.");
  practice_three_utils.greetPerson();
  
  print("\n---------------------------------------------------------------------------------------------------------------\n");
  
  print("4. Write a program in Dart that generates random password.");
  practice_three_utils.getRandomPasswordExercise();
  
  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("5. Write a program in Dart that find the area of a circle using function. Formula: pi * r * r");
  practice_three_utils.getCircleExcercise();
  
  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("6. Write a program in Dart to reverse a String using function.");
  print("Reversed Name: ${main_util.jaysel.split('').reversed.join().capitalizeByWord()}");

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("7. Write a program in Dart to calculate power of a certain number. For e.g 5^3=125");
  practice_three_utils.getPowerOfNumberExcercise();
  
  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("8. Write a function in Dart named add that takes two numbers as arguments and returns their sum.");
  double num1Input = 4, num2Input = 2.5;
  print("$num1Input + $num2Input = ${practice_three_utils.getSumExercise(num1: num1Input, num2: num2Input)}");
  
  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("9. Write a function in Dart called maxNumber that takes three numbers as arguments and returns the largest number.");
  int a = 6, b = 7, c = 1;
  print("In [$a, $b, $c], ${practice_three_utils.getHighestNumber(a, b, c)} is the highest number");
  
  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("10. Write a function in Dart called isEven that takes a number as an argument and returns True if the number is even, and False otherwise.");
  print("8 is a ${main_util.checkIsOddOrEvenNumber(8) ? "even number" : "odd number"}");
  
  print("\n---------------------------------------------------------------------------------------------------------------\n");
  
  print("11. Write a function in Dart called createUser with parameters name, age, and isActive, where isActive has a default value of true.");
  print(practice_three_utils.createUser(name: "Jaysel", age: 27) ? "User created.": "User creation failed");
  
  print("\n---------------------------------------------------------------------------------------------------------------\n");
  
  print("12. Write a function in Dart called calculateArea that calculates the area of a rectangle. It should take length and width as arguments, with a default value of 1 for both. Formula: length * width.");
  print("30 x 60 has area of = ${practice_three_utils.calculateRectangleArea(length: 30, width: 60)}");

  print("\n********************************************** END OF EXERCISE 3 **********************************************\n");
}