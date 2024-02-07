import 'dart:io';

void main() {
  const con = 7;
  printName();
  printRawString();
  print("constant value = $con");
  print(calculate(con.toDouble(), 10, 100));
  print("enter number: ");
  int? toMultiply = int.parse(stdin.readLineSync()!);
  multiply(toMultiply);
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

void multiply(int x) {
  print("entered number is $x with square root of ${x * x}");
}
