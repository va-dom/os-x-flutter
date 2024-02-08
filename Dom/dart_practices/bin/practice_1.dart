import 'dart:io';

void main() {
  const con = 7;
  const word = "HA HA HA HA HA HA";
  printName();
  printRawString();
  print("constant value = $con");
  print("${calculate(con.toDouble(), 10, 100)}\n");
  print("enter number: ");
  int? toMultiply = int.parse(stdin.readLineSync()!);
  getSquareRoot(toMultiply);
  print("enter first name: ");
  String? firstName = stdin.readLineSync()!;
  print("\nenter first lastname: ");
  String? lastName = stdin.readLineSync()!;
  printFullName(firstName, lastName);
  print("enter dividend: ");
  double? dividend = double.parse(stdin.readLineSync()!);
  print("enter number: ");
  double? divisor = double.parse(stdin.readLineSync()!);
  getQuotient(dividend, divisor);
  getRemainder(dividend, divisor);
  print("enter first number: ");
  int? firstNumber = int.parse(stdin.readLineSync()!);
  print("enter second number: ");
  int? secondNumber = int.parse(stdin.readLineSync()!);
  swapNumber(firstNumber, secondNumber);
  removeWhiteSpaces(word);
  intToString(con.toString());
  splitTheBill(1000, 5);
  print("enter distance in km: ");
  double? distance = double.parse(stdin.readLineSync()!);
  print("enter speed in km/h: ");
  double? speed = double.parse(stdin.readLineSync()!);
  print("");
  getTime(distance, speed);
}

void printName() {
  print("My name is Dom\n");
}

void printRawString() {
  print(r"Hello I am “John Doe”");
  print(r"Hello I’am “John Doe”");
  print("");
}

double calculate(double x, y, z) {
  double result;
  result = x * y * z;
  return result = result / 100;
}

void getSquareRoot(int x) {
  print("entered number is $x with square root of ${x * x}\n");
}

void printFullName(String fn, String ln) {
  print("full name is: $fn $ln\n");
}

void getQuotient(double x, double y) {
  print("\nthe quotient is: ${x / y}");
}

void getRemainder(double x, double y) {
  print("the remainder is: ${x % y}\n");
}

void swapNumber(int x, int y) {
  int z;
  print("\nfrom first number $x and second number $y\n");
  z = x;
  x = y;
  y = z;
  print("to first number $x and second number $y\n");
}

void removeWhiteSpaces(String word) {
  String newWord;
  print('Original string: $word');
  newWord = word.replaceAll(RegExp(r'\s+'), '');
  print('String after removing white spaces: $newWord');
}

void intToString(String word) {
  print("$word is ${word.runtimeType}");
  int num = int.parse(word);
  print("$word now is ${num.runtimeType}");
}

void splitTheBill(double total, double pax) {
  double splitBill = total / pax;
  print("Bill of $total will be split by ${pax.toInt()}");
  print("result is $splitBill");
}

void getTime(double distance, double speed) {
  double time = distance / speed;
print("you'll be in the office in $time hour(s)");
}
