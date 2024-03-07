import 'dart:io';
import 'practice_app.dart' as main_util;


getOddOrEvenNumberPractice() {
  print("Enter a number:");
  int val = main_util.getNumericInput();

  print(main_util.checkIsOddOrEvenNumber(val) ? 'It is an even number!' : 'It is an odd number!');
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
  double val = main_util.getDoubleInput();

  if (val > 0) {
    print("${val.toStringAsFixed(2)} is positive.");
  } else if (val < 0) {
    print("${val.toStringAsFixed(2)} is negative.");
  } else {
    print("$val is zero.");
  }
}

getSumOfNaturalNumberPractice() {
  stdout.write('Enter a positive integer: ');
  int input = main_util.getNumericInput(hasPositiveValidation: true);
  
  int sum = calculateSum(input);
  
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

void openCalculator () {

  double currentTotal = 0;
  bool isContinue = true;
  int counter = 0;
  String operation = "";
  double currentInput = 0;

  do {
    if(counter == 0) {
      stdout.write("Enter number: ");
      currentInput = main_util.getDoubleInput();
      currentTotal = currentInput;
      operation = 'handler';
      counter += 1;
      continue;
    } else {
      stdout.write("Enter operation (+, -, *, /) or type 'exit': ");
      operation = stdin.readLineSync()!;

      bool isExit = getCurrentTotal(currentInput, currentTotal, operation) == null;
      if (isExit) {
        return;
      }

      stdout.write("Enter number: ");
      currentInput = main_util.getDoubleInput();

      currentTotal = getCurrentTotal(currentInput, currentTotal, operation)!;

      print("\n-----------------------------------");
      print("Current Total: ${currentTotal.toStringAsFixed(2)}");
      print("-----------------------------------\n");
    }
  } while (isContinue);
}

double? getCurrentTotal(double currentInput, double currentTotal, String operation) {
  switch(operation.toLowerCase()) {
        case '+':
          return currentTotal += currentInput;
        case '-':
          return currentTotal -= currentInput;
        case '*':
          return currentTotal *= currentInput;
        case '/':
          return currentTotal /= currentInput;
        case 'handler':
          break;
        case 'exit':
          break;
        default:
          print("Invalid operation!");
          break;
      }

      return null;
}
