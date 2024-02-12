String getMenu() {
  return """
  Hello to Jaysel\'s playground!
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

bool isNumeric(String str) {
  RegExp _numeric = RegExp(r'^-?[0-9]+$');
  return _numeric.hasMatch(str);
}
