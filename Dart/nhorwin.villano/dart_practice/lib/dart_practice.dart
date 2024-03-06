import 'dart:io';

// Input Validations
int inputInteger() {
  while (true) {
    try {
      int number = int.parse(stdin.readLineSync()!);
      return number;
    } on FormatException {
      print("Invalid Input! Accepts 'int' only");
    }
  }
}

int inputNaturalInteger() {
  while (true) {
    try {
      int number = int.parse(stdin.readLineSync()!);
      if (number < 0) {
        throw FormatException();
      }
      return number;
    } on FormatException {
      print("Invalid Input! Accepts positive natural number only");
    }
  }
}

String inputString() {
  while (true) {
    try {
      String text = stdin.readLineSync()!;
      return text;
    } on FormatException {
      print("Invalid Input! Accepts 'String' only");
    }
  }
}

double inputDouble() {
  while (true) {
    try {
      double number = double.parse(stdin.readLineSync()!);
      return number;
    } on FormatException {
      print("Invalid Input! Accepts 'double' only");
    }
  }
}

String inputChar() {
  while (true) {
    try {
      String char = stdin.readLineSync()!;
      if (char.length == 1 && isAlphabetOnly(char)) {
        return char;
      } else {
        throw FormatException();
      }
    } on FormatException {
      print("Invalid Input! Accepts '1' alphabet/character only");
    }
  }
}

bool isAlphabetOnly(String str) {
  // Define a regular expression pattern that matches only alphabetic characters
  RegExp alphaPattern = RegExp(r'^[a-zA-Z]+$');
  return alphaPattern.hasMatch(str);
}
