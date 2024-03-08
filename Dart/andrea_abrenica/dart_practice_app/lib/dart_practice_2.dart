import 'dart:io';
import 'dart_practice_app.dart' as main_func;

getOddEven() {
  print('Please enter a number:');
  int number = int.parse(stdin.readLineSync()!);

  if (number % 2 == 0) {
    print('$number is even.');
  } else {
    print('$number is odd.');
  }
}

getVowelsCons() {
  RegExp vowelRegex = RegExp(r'[aeiouAEIOU]');

  print("Please enter a letter:");
  String selectedInput = stdin.readLineSync()!;
  while (selectedInput.isEmpty ||
      selectedInput.length > 1 ||
      !main_func.isValidAlphabet(selectedInput)) {
    print("Invalid input. Enter a letter:");
    selectedInput = stdin.readLineSync()!;
  }

  print(vowelRegex.hasMatch(selectedInput) ? 'A vowel :)' : 'A consonant :)');
}

getPositiveNegZero() {
  print('Enter a number:');
  double number = double.parse(stdin.readLineSync()!);

  // Check if the number is positive, negative, or zero
  if (number > 0) {
    print('$number is positive.');
  } else if (number < 0) {
    print('$number is negative.');
  } else {
    print('$number is zero.');
  }
}

printName(int count) {
  int counter = 0;
  String toPrint = "";
  while (counter <= count) {
    toPrint =
        toPrint + (main_func.fullName == "" ? " " : "") + main_func.fullName;
    counter++;
  }

  print(toPrint);
}

getSumOfNumbers() {
  {
    print('Enter the number of elements:');
    int n = int.parse(stdin.readLineSync()!);

    int sum = 0;
    for (int i = 0; i < n; i++) {
      print('Enter number ${i + 1}:');
      int num = int.parse(stdin.readLineSync()!);
      sum += num;
    }
    print('The sum of the entered numbers is: $sum');
  }
}

getMultiplicationTablesOfFive() {
  int limit = 10;
  print('Multiplication Table of 5:');
  for (int i = 1; i <= limit; i++) {
    print('5 x $i = ${5 * i}');
  }
}

getMultiplicationTables() {
  int limit = 10;
  for (int i = 1; i <= 9; i++) {
    print('Multiplication Table of $i:');
    for (int j = 1; j <= limit; j++) {
      print('$i x $j = ${i * j}');
    }
    print('');
  }
}

getSimpleCalculator() {
  double num1, num2;
  String operation;

  print('Enter first number:');
  num1 = double.parse(stdin.readLineSync()!);

  print('Enter second number:');
  num2 = double.parse(stdin.readLineSync()!);

  print('Enter operation (+, -, *, /):');
  operation = stdin.readLineSync()!;

  double result;
  switch (operation) {
    case '+':
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      if (num2 != 0) {
        result = num1 / num2;
      } else {
        print('Error: Division by zero');
        return;
      }
      break;
    default:
      print('Error: Invalid operation');
      return;
  }

  print('Result: $result');
}

print1to100not41() {
  for (int i = 1; i <= 100; i++) {
    if (i != 41) {
      print(i);
    }
  }
}
