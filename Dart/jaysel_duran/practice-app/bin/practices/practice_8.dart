
import 'dart:io';
import 'package:practice_app/practice_8.dart' as practice_eight_utils;

void runPractice(){
  bool exit = false;
  while (!exit) {
    stdout.write('Enter practice question number (1-10, or 0 to exit): ');
    String? input = stdin.readLineSync();

    if (input == '0') {
      print('Exiting...');
      break;
    } else if (input != null && input.isNotEmpty && RegExp(r'^[1-9]$|^10$').hasMatch(input)) {
      int questionNumber = int.parse(input);
      switch (questionNumber) {
        case 1:
          question1();
          exit = true;
          break;
        case 2:
          question2();
          exit = true;
          break;
        case 3:
          question3();
          exit = true;
          break;
        case 4:
          question4();
          exit = true;
          break;
        case 5:
          question5();
          exit = true;
          break;
        case 6:
          question6();
          exit = true;
          break;
        case 7:
          question7();
          exit = true;
          break;
        case 8:
          question8();
          exit = true;
          break;
        case 9:
          question9();
          exit = true;
          break;
        case 10:
          question10();
          exit = true;
          break;
      }
    } else {
      print('Invalid input. Please enter a number between 0 and 10.');
    }
  }
}

void question1() {
  print("1. Explain what is asynchronous programming in dart?");
  print("Asynchronous programming allows you to execute multiple tasks at the same time, without waiting for each one to finish before starting the next.");
}

void question2() {
  print("2. What is Future in dart?");
  print("We use Future in dart when dealing with operations that may take some time to complete, such as fetching data from the internet or reading from a file. ");
}

void question3() {
  print("3. Write a program to print current time after 2 seconds using Future.delayed().");
  practice_eight_utils.runPrintCurrentTimeWithDelay();
}

void question4() {
  print("4. Write a program in dart that reads csv file and print it’s content.");
  practice_eight_utils.runPrintCSVContent();
}

void question5() {
  print("5. Write a program in dart that uses Future class to perform multiple asynchronous operations, wait for all of them to complete, and then print the results.");
  practice_eight_utils.runAsyncSamples();
}

void question6() {
  print("6. Write a Dart program to calculate the sum of two numbers using async/await.");
  practice_eight_utils.runSumSimulationUsingAsync();
}

void question7() {
  print("7. Write a Dart program that takes in two integers as input, waits for 3 seconds, and then prints the sum of the two numbers.");
  practice_eight_utils.runSumCalculatorUsingAsync();
}

void question8() {
  print("8. Write a Dart program that takes a list of strings as input, sorts the list asynchronously, and then prints the sorted list.");
  practice_eight_utils.runSortingUsingAsync();
}

void question9() {
  print("9. Write a Dart program that takes a list of integers as input, multiplies each integer by 2 asynchronously, and then prints the modified list.");
  practice_eight_utils.runMultiplyListBy2UsingAsync();
}

void question10() {
  print("10. Write a Dart program that takes a string as input, reverses the string asynchronously, and then prints the reversed string.");
  practice_eight_utils.runReversedStringUsingAsync();
}
