import 'package:practice_app/practice_app.dart' as main_util;
import 'package:practice_app/practice_1.dart' as practice_one_utils;

void runPractice(){
  print("**************** EXERCISE 1 ****************");

  print("[1] Write a program to print your name in Dart:");
  print("Hi, I'm ${main_util.jaysel} :D");

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("[2] Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.");
  print("""Hello, I am "John Doe"
  Hello I’am “John Doe”""");

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("[3] Declare constant type of int set value 7.");
  print(main_util.declaredNum);

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("[4] Write a program in Dart that finds simple interest. Formula= (p * t * r) / 100");
  practice_one_utils.getInterest();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("[5] Write a program to print a square of a number using user input.");
  practice_one_utils.getSquareRoot();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("[6] Write a program to print full name of a person from first name and last name using user input.");
  practice_one_utils.getInputName();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("[7] Write a program to find quotient and remainder of two integers.");
  practice_one_utils.getQuotientAndRemainder();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("[8] Write a program to swap two numbers.");
  practice_one_utils.getSwappingNumbers();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("[9] Write a program in Dart to remove all whitespaces from String.");
  practice_one_utils.printStringWithWhitespaces();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("[10] Write a Dart program to convert String to int.");
  print(int.parse("1"));

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("[11] Suppose, you often go to restaurant with friends and you have to split amount of bill. Write a program to calculate split amount of bill. Formula= (total bill amount) / number of people");
  practice_one_utils.getTotalBill();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("[12] Suppose, your distance to office from home is 25 km and you travel 40 km per hour. Write a program to calculate time taken to reach office in minutes. Formula= (distance) / (speed)");
  print("Time taken to reach office: ${practice_one_utils.calculateTime(25, 40).toStringAsFixed(2)} minutes");

  print("\n---------------------------------------------------------------------------------------------------------------\n");
}