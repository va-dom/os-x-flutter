import 'dart:math';

void printOwnName() {
  print("Nhorwin John Villano");
}

void greet(String name) {
  print("Hello $name");
}

int generateRandomPassword() {
  int password = Random().hashCode;
  return password;
}

void getCircleArea(double r) {
  const double pi = 3.14;
  double area = pi * r * r;
  print("The area is $area");
}

String reverseString(String str) {
  String reversed = '';
  for (int i = str.length - 1; i >= 0; i--) {
    reversed += str[i];
  }
  return reversed;
}

double calculatePower(double base, int exponent) {
  double result = 1;
  for (int i = 0; i < exponent.abs(); i++) {
    result *= base;
  }
  if (exponent < 0) {
    result = 1 / result;
  }
  return result;
}

int add(int num1, int num2) {
  return num1 + num2;
}

int getLargestNumber(int num1, int num2, int num3) {
  int maxnum = max(max(num1, num2), num3);
  return maxnum;
}

bool isEven(int num) {
  return (num % 2 == 0) ? true : false;
}

void createUser(String name, int age, {bool isActive = true}) {
  print("Name : $name");
  print("Age : $age");
  print("isActive : $isActive");
}

void calculateArea({int length = 1, int width = 1}) {
  print("Length : $length");
  print("Width : $width");
  int area = length * width;
  print("Area : $area");
}
