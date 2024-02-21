// import 'package:dart_practice_app/dart_practice_app.dart' as main_func;
import 'package:dart_practice_app/dart_practice_2.dart' as practice_two_func;

void runPractice() {
  print(" PRACTICE 2 ");

  print("1. Write a dart program to check if the number is odd or even.");
  practice_two_func.getOddEven();

  print(
      "2. Write a dart program to check whether a character is a vowel or consonant.");
  practice_two_func.getVowelsCons();

  print(
      "3. Write a dart program to check whether a number is positive, negative, or zero.");
  practice_two_func.getPositiveNegZero();

  print("4. Write a dart program to print your name 100 times.");
  practice_two_func.printName(100);

  print("5. Write a dart program to calculate the sum of natural numbers.");
  practice_two_func.getSumOfNumbers();

  print("6. Write a dart program to generate multiplication tables of 5.");
  practice_two_func.getMultiplicationTablesOfFive();

  print("7. Write a dart program to generate multiplication tables of 1-9.");
  practice_two_func.getMultiplicationTables();

  print(
      "8. Write a dart program to create a simple calculator that performs addition, subtraction, multiplication, and division.");
  practice_two_func.getSimpleCalculator();

  print("9. Write a dart program to print 1 to 100 but not 41.");
  practice_two_func.print1to100not41();
}
