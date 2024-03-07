import 'dart:io';

const jaysel = "Jaysel Duran";
const declaredNum = 7;

extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }

    String capitalizeByWord() {
    if (trim().isEmpty) {
      return '';
    }
    return split(' ')
        .map((element) =>
            "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}")
        .join(" ");
  }
}

String getMenu() {
  return """
\n--------------------------------------------------------------\n
  Hello to Jaysel's playground!
  What exercise do you want to check?
  [1] Practice 1
  [2] Practice 2
  [3] Practice 3
  [4] Practice 4
  [5] Practice 5
  [6] Practice 6
  [7] Practice 7
  [8] Practice 8
  [0] Exit
\n--------------------------------------------------------------\n
Select: """;
}

int getNumericInput ({bool hasPositiveValidation = false}) {
  bool isValid = false;
  int returnedValue;
  while(!isValid) {
    try {
      int val = int.parse(stdin.readLineSync()!);
      if(isNumeric(val) && hasPositiveValidation ? isValidPositiveNumber(val): true) {
        returnedValue = val;
        break;
      } else {
        throw FormatException();
      }
    } on FormatException {
      stdout.write("Invalid input. Please input the valid value: ");
    }
  }

  return returnedValue;
}

double getDoubleInput() {
  bool isValid = false;
  late double returnedValue;

  while(!isValid) {
    try {
      returnedValue = double.parse(stdin.readLineSync()!);
      break;
    } on FormatException {
      stdout.write("Invalid input. Please input the valid value: ");
    }
  }

  return returnedValue;
}

bool isDouble(num val) {
  RegExp doubleNumeric = RegExp(r'^(-?)(0|([1-9][0-9]*))(\\.[0-9]+)?$');
  return doubleNumeric.hasMatch(val.toString());
}

bool isNumeric(int val) {
  RegExp numericRegex = RegExp(r'^-?[0-9]+$');
  return numericRegex.hasMatch(val.toString());
}

bool checkIsOddOrEvenNumber(int selectedInput) {
  return selectedInput % 2 == 0;
}

bool isValidAlphabet(String val) {
  RegExp alphabetRegex = RegExp(r'[a-zA-Z]');
  return alphabetRegex.hasMatch(val);
}

bool isValidPositiveNumber(int val) {
  RegExp positiveRegex = RegExp(r'^[1-9]\d*$');
  return positiveRegex.hasMatch(val.toString());
}

printName(int count) {
  int counter = 1;
  String toPrint = "";
  while(counter <= count) {
    toPrint = toPrint.isEmpty ? jaysel : "$toPrint * $jaysel";
    counter++;
  }

  print(toPrint);
}

printNumListWithException({int fromVal = 1, required int toVal,List<int>? except, bool evenOnly = false, bool oddOnly = false}) {
  for (int i = fromVal; i <= toVal; i++) {
    if (except!.isEmpty || !except.contains(i)) {
      if(evenOnly || oddOnly) {
        if (evenOnly && i % 2 == 0) {
          print(i); // prints event numbers only
        } else if (oddOnly && i % 2 > 0) {
          print(i); // prints odd numbers only
        }
      } else {
        print(i); // default
      }
    }
  }
}

clearTerminal() {
  print(Process.runSync("clear", [], runInShell: true).stdout);
}
