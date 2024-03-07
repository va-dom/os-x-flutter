import 'dart:io';
import 'dart:math';
import 'practice_app.dart' as main_util;

greetPerson() {
  print("Enter your name:");
  String name = stdin.readLineSync()!;
  while (name.isEmpty) {
    print("Invalid input. Enter your name:");
    name = stdin.readLineSync()!;
  }

  String trimmedName = (name).trim();
  print("Hi ${trimmedName.capitalizeByWord()}! Have an awesome day :)");
}

getRandomPasswordExercise() {
  print("To generate a random password, Enter length of password:");
  int pwLength = main_util.getNumericInput();

  print("Password Generated: ${generateRandomPassword(pwLength)}");
}

String generateRandomPassword(int length) {
  const String chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()-_+=<>?';
  Random random = Random();
  String password = '';

  for (int i = 0; i < length; i++) {
    password += chars[random.nextInt(chars.length)];
  }

  return password;
}

getCircleExcercise(){
  print("To compute the area of a circle, Enter radius:");
  double radius = main_util.getDoubleInput();

  double area = calculateCircleArea(radius);
  print('Area of the circle: $area');
}

double calculateCircleArea(double radius) {
  return pi * radius * radius;
}

getPowerOfNumberExcercise() {
  print("To compute power of a number, Enter base:");
  int base = main_util.getNumericInput();

  print("Enter exponent:");
  int exponent = main_util.getNumericInput();

  int result = calculatePower(base, exponent);
  print('$base^$exponent = $result');
}

int calculatePower(int base, int exponent) {
  int result = 1;
  for (int i = 0; i < exponent; i++) {
    result *= base;
  }
  return result;
}

getSumExercise({required double num1, required double num2}) {
  return num1 + num2;
}

getHighestNumber(int num1, int num2, int num3) {
  return max(max(num1, num2), num3);
}

bool createUser({required String name, required int age, bool isActive = true}) {
  return true;
}

double calculateRectangleArea({double length = 1, double width = 1}) {
  return length * width;
}