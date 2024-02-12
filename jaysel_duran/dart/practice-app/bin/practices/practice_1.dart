import 'dart:io';
import '../../lib/practice_app.dart' as lib;

void runPractice(){
  print("**************** EXERCISE 1 ****************");

  print("[1] Write a program to print your name in Dart:");
  print("= Hi, I\'m ${lib.jaysel} :D");

  print("[2] Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.");
  print("""= Hello, I am \"John Doe\"
  Hello I\’am \“John Doe\”""");

  print("[3] Declare constant type of int set value 7.");
  print(lib.declaredNum);

  print("[4] Write a program in Dart that finds simple interest. Formula= (p * t * r) / 100");
  lib.getInterest();

  print("[5] Write a program to print a square of a number using user input.");
  lib.getSquareRoot();

  print("[6] Write a program to print full name of a person from first name and last name using user input.");
  lib.getInputName();

  print("[7] Write a program to find quotient and remainder of two integers.");
  lib.getQuotientAndRemainder();

  print("[8] Write a program to swap two numbers.");
  lib.getSwappingNumbers();

  print("[9] Write a program in Dart to remove all whitespaces from String.");
  lib.printStringWithWhitespaces();

  print("[10] Write a Dart program to convert String to int.");
  print(int.parse("1"));

  print("[11] Suppose, you often go to restaurant with friends and you have to split amount of bill. Write a program to calculate split amount of bill. Formula= (total bill amount) / number of people");
  lib.getTotalBill();

  print("[12] Suppose, your distance to office from home is 25 km and you travel 40 km per hour. Write a program to calculate time taken to reach office in minutes. Formula= (distance) / (speed)");
  lib.calculateTime(25, 40);
}