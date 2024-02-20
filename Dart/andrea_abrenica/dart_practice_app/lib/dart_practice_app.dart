const fullName = "Andrea Abrenica";
const declareNum = 7;

String getMenu() {
  return """
  Hello to Andeng! What exercise do you want to check?
  [1] Practice 1
  [2] Practice 2
  [3] Practice 3
  [4] Practice 4
  [7] Practice 7
  [8] Practice 8""";
}

bool isNumeric(String str) {
  // Define a regular expression pattern to match numeric strings
  RegExp numeric = RegExp(r'^-?[0-9]+$');
  // Check if the provided string matches the numeric pattern
  return numeric.hasMatch(str);
}

bool isInputValidNumeric(String val) {
  // Checks if the input string is not empty and if it's numeric
  return val.isNotEmpty && isNumeric(val);
}

bool isDouble(String str) {
  // Regular expression pattern to match a double value
  RegExp double = RegExp(r'^(-?)(0|([1-9][0-9]*))(\.[0-9]+)?$');
  // Check if the provided string matches the double pattern
  return double.hasMatch(str);
}

bool isInputValidDouble(String val) {
  // Checks if the input string is not empty and if it represents a valid double
  return val.isNotEmpty && isDouble(val);
}

bool checkIsOddOrEvenNumber(int selectedInput) {
  // Returns true if the input is even, false if it's odd
  return selectedInput % 2 == 0;
}

bool isValidAlphabet(String val) {
  // Define a regular expression pattern to match alphabet characters
  RegExp alphabetRegex = RegExp(r'[a-zA-Z]');
  // Check if the provided string contains at least one alphabet character
  return alphabetRegex.hasMatch(val);
}
