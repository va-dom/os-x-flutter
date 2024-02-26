import 'package:practice_app/practice_app.dart' as main_util;
import 'package:practice_app/practice_2.dart' as practice_two_utils;

void runPractice(){
  print("**************** EXERCISE 2 ****************\n");

  print("Write a dart program to check if the number is odd or even.");
  practice_two_utils.getOddOrEvenNumberPractice();

  print("\n---------------------------------------------------------------------------------------------------------------\n");
  
  print("Write a dart program to check whether a character is a vowel or consonant.");
  practice_two_utils.getVowelCheckerPractice();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Write a dart program to check whether a number is positive, negative, or zero.");
  practice_two_utils.getInputIsPositiveNegativeOrZeroPractice();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Write a dart program to print your name 100 times.");
  main_util.printName(100);

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Write a dart program to calculate the sum of natural numbers.");
  practice_two_utils.getSumOfNaturalNumberPractice();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Write a dart program to generate multiplication tables of 5.");
  practice_two_utils.generateMultiplicationTable(5);

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Write a dart program to generate multiplication tables of 1-9.");
  int multiplicationTableCounter = 1;
  while(multiplicationTableCounter <= 9) {
    practice_two_utils.generateMultiplicationTable(multiplicationTableCounter);
    multiplicationTableCounter++;
    print("\n---------------------------------------------------------------\n");
  }

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Write a dart program to create a simple calculator that performs addition, subtraction, multiplication, and division.");
  practice_two_utils.openCalculator();


  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Write a dart program to print 1 to 100 but not 41.");
  main_util.printNumListWithException(toVal: 100, except: [41]);

  print("\n---------------------------------------------------------------------------------------------------------------\n");
}