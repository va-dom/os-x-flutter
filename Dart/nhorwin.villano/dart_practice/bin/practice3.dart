import 'package:dart_practice/practice3.dart' as practice3_lib;

void runPractice() {
  print("---------------------------------------------------");
  print("Questions for Practice 3");
  print("---------------------------------------------------");

  print("1. Write a program in Dart to print your own name using function.");
  practice3_lib.printOwnName();
  print("\n");

  print(
      "2. Write a program in Dart to print even numbers between intervals using function. ");
  practice3_lib.printEvenNum(1, 10);
  print("\n");

  print(
      "3. Create a function called greet that takes a name as an argument and prints a greeting message. ");
  practice3_lib.greet("Nhorwin John");
  print("\n");

  print("4. Write a program in Dart that generates random password. ");
  print('Password: ${practice3_lib.generateRandomPassword(10)}');
  print("\n");

  print(
      "5. Write a program in Dart that find the area of a circle using function. ");
  print("r = 5");
  practice3_lib.getCircleArea(5);
  print("\n");

  print("6. Write a program in Dart to reverse a String using function.");
  String originalString = 'Nhorwin';
  String reversedString = practice3_lib.reverseString(originalString);
  print('Original String: $originalString');
  print('Reversed String: $reversedString');
  print("\n");

  print("7. Write a program in Dart to calculate power of a certain number.");
  double base = 5;
  int exponent = 6;
  print("Base = $base");
  print("exponent = $exponent");
  num value = practice3_lib.calculatePower(base, exponent);
  print("The value of $base raise to the power of $exponent is $value");
  print("\n");

  print(
      "8. Write a function in Dart named add that takes two numbers as arguments and returns their sum.");
  int number1 = 5;
  int number2 = 6;
  print("Number1 = $number1");
  print("Number2 = $number2");
  int sum = practice3_lib.add(number1, number2);
  print("Sum = $sum");
  print("\n");

  print(
      "9. Write a function in Dart called maxNumber that takes three numbers as arguments and returns the largest number.");
  number1 = 5;
  number2 = 6;
  int number3 = 7;
  print("Number1 = $number1");
  print("Number2 = $number2");
  print("Number3 = $number3");
  int maxNum = practice3_lib.maxNumber(number1, number2, number3);
  print("Largest Number = $maxNum");
  print("\n");

  print(
      "10. Write a function in Dart called isEven that takes a number as an argument and returns True if the number is even, and False otherwise.");
  number1 = 5;
  number2 = 6;
  print("Number1 = $number1");
  bool result = practice3_lib.isEven(number1);
  print("$number1 : $result");
  print("Number2 = $number2");
  result = practice3_lib.isEven(number2);
  print("$number2 : $result");
  print("\n");

  print(
      "11. Write a function in Dart called createUser with parameters name, age, and isActive, where isActive has a default value of true.");
  practice3_lib.createUser("Nhorwin", 27);
  print("\n");
  practice3_lib.createUser("Villano", 27, isActive: false);
  print("\n");

  print(
      "12. Write a function in Dart called calculateArea that calculates the area of a rectangle. It should take length and width as arguments, with a default value of 1 for both.");
  practice3_lib.calculateArea();
  print("\n");
  practice3_lib.calculateArea(length: 3, width: 4);
  print("\n");
}
