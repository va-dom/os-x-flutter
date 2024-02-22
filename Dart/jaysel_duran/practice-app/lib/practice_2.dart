import 'dart:io';
import 'practice_app.dart' as main_util;


getOddOrEvenNumberPractice() {
  print("Enter a number:");
  String val = stdin.readLineSync()!;
  while (!main_util.isInputValidNumeric(val)) {
    print("Input a valid number:");
    val = stdin.readLineSync()!;
  }

  print(main_util.checkIsOddOrEvenNumber(int.parse(val)) ? 'It is an even number!' : 'It is an odd number!');
}

getVowelCheckerPractice() {
  RegExp vowelRegex = RegExp(r'[aeiouAEIOU]');

  print("Enter a letter:");
  String selectedInput = stdin.readLineSync()!;
  while (
    selectedInput.isEmpty ||
    selectedInput.length > 1 ||
    !main_util.isValidAlphabet(selectedInput)
  ) {
    print("Invalid input. Enter a letter:");
    selectedInput = stdin.readLineSync()!;
  }

  print(vowelRegex.hasMatch(selectedInput) ? 'A vowel :)' : 'A consonant :)');
}

getInputIsPositiveNegativeOrZeroPractice() {
  print("Enter a number: ");
  String val = stdin.readLineSync()!;
  while (!main_util.isInputValidDouble(val)) {
    print("Input a valid number:");
    val = stdin.readLineSync()!;
  }

  double number = double.parse(val);
  if (number > 0) {
    print("${number.toStringAsFixed(2)} is positive.");
  } else if (number < 0) {
    print("${number.toStringAsFixed(2)} is negative.");
  } else {
    print("$number is zero.");
  }
}

printName(int count) {
  int counter = 0;
  String toPrint = "";
  while(counter <= count) {
    toPrint = "$toPrint * ${main_util.jaysel}";
    counter++;
  }

  print(toPrint);
}

getSumOfNaturalNumberPractice() {
  stdout.write('Enter a positive integer: ');
  String input = stdin.readLineSync()!;

  while (!main_util.isInputValidNumeric(input)) {
    print("Input a valid number:");
    input = stdin.readLineSync()!;
  }
  
  int sum = calculateSum(int.parse(input));
  
  print('The sum of natural numbers up to $input is: $sum');
}

int calculateSum(int n) {
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += i;
  }
  return sum;
}

generateMultiplicationTable(int selectedNum, [int max = 10]) {
  print('Multiplication Table of $selectedNum:');
  for (int i = 1; i <= max; i++) {
    print('$selectedNum * $i = ${selectedNum * i}');
  }
}

openCalculator(){
  print("Calculator");
  print("Enter first number:");
  String num1 = stdin.readLineSync()!;
  while (!main_util.isInputValidDouble(num1)) {
    print("Input a valid first number:");
    num1 = stdin.readLineSync()!;
  }
  
  print("Enter second number:");
  String num2 = stdin.readLineSync()!;
  while (!main_util.isInputValidDouble(num2.toString())) {
    print("Input a valid second number:");
    num2 = stdin.readLineSync()!;
  }
  
  print("Enter operation (+, -, *, /):");
  String operation = stdin.readLineSync()!;
  
  double result = 0;
  
  switch(operation) {
    case '+':
      result = double.parse(num1) + double.parse(num2);
      break;
    case '-':
      result = double.parse(num1) - double.parse(num2);
      break;
    case '*':
      result = double.parse(num1) * double.parse(num2);
      break;
    case '/':
      if(double.parse(num2) != 0) {
        result = double.parse(num1) / double.parse(num2);
      } else {
        print("Error: Division by zero!");
        return;
      }
      break;
    default:
      print("Invalid operation!");
      return;
  }
  
  print("Result: $result");
}

printWithException(int max, List<int> exempted) {
  for (int i = 1; i <= max; i++) {
    if (!exempted.contains(i)) {
      print(i);
    }
  }
}
