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
    toPrint = toPrint + (main_util.jaysel == "" ? " " : "") + main_util.jaysel;
    counter++;
  }

  print(toPrint);
}