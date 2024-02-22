const jaysel = "Jaysel Duran";
const declaredNum = 7;

String getMenu() {
  return """
  Hello to Jaysel's playground!
  What exercise do you want to check?
  [1] Practice 1
  [2] Practice 2
  [3] Practice 3
  [4] Practice 4
  [5] Practice 5
  [6] Practice 6
  [7] Practice 7
  [8] Practice 8""";
}

bool isInputValidNumeric(String val) {
  return val.isNotEmpty &&
    isNumeric(val);
}

bool isInputValidDouble(String val) {
  return val.isNotEmpty &&
    isDouble(val);
}

bool isInputValidPositiveNumber(String val) {
  return val.isNotEmpty ||
    int.parse(val) != 0 ||
    isValidPositiveNumber(val);
}

bool isDouble(String str) {
  RegExp doubleNumeric = RegExp(r'^(-?)(0|([1-9][0-9]*))(\\.[0-9]+)?$');
  return doubleNumeric.hasMatch(str);
}

bool isNumeric(String str) {
  RegExp numericRegex = RegExp(r'^-?[0-9]+$');
  return numericRegex.hasMatch(str);
}

bool checkIsOddOrEvenNumber(int selectedInput) {
  return selectedInput % 2 == 0;
}

bool isValidAlphabet(String val) {
  RegExp alphabetRegex = RegExp(r'[a-zA-Z]');
  return alphabetRegex.hasMatch(val);
}

bool isValidPositiveNumber(String val) {
  RegExp positiveRegex = RegExp(r'^[1-9]\d*$');
  return positiveRegex.hasMatch(val);
}
