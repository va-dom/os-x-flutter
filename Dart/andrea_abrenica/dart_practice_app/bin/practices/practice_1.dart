import 'package:dart_practice_app/dart_practice_app.dart' as main_func;
import 'package:dart_practice_app/dart_practice_1.dart' as practice_one_func;

void runPractice() {
  print("**************** PRACTICE 1 ****************");

  print("1. Write a program to print your name in Dart:");
  print("= Hi, I'm ${main_func.fullName} <3");

  print(
      "2. Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.");
  print("""= Hello, I am \"John Doe\"
  Hello I\’am \“John Doe\”""");

  print("3. Declare constant type of int set value 7.");
  print(main_func.declareNum);

  print(
      "4. Write a program in Dart that finds simple interest. Formula= (p * t * r) / 100");
  practice_one_func.getInterest();

  print("5. Write a program to print a square of a number using user input.");
  practice_one_func.getSquareRoot();

  print(
      "6. Write a program to print full name of a from first name and last name using user input.");
  practice_one_func.getInputName();

  print("7. Write a program to find quotient and remainder of two integers.");
  practice_one_func.getQuotientAndRemainder();

  print("8. Write a program to swap two numbers.");
  practice_one_func.getSwappingNumbers();

  print("9. Write a program in Dart to remove all whitespaces from String.");
  practice_one_func.printStringWithWhitespaces();

  print("10. Write a Dart program to convert String to int.");
  print(int.parse("1"));

  print(
      "11. Suppose, you often go to restaurant with friends and you have to split amount of bill. Write a program to calculate split amount of bill. Formula= (total bill amount) / number of people");
  practice_one_func.getTotalBill();

  print(
      "12. Suppose, your distance to office from home is 25 km and you travel 40 km per hour. Write a program to calculate time taken to reach office in minutes. Formula= (distance) / (speed)");
  print(
      "Time taken to reach office: ${practice_one_func.calculateTime(25, 40).toStringAsFixed(2)} minutes");
}
