import 'dart:io';
import 'dart:math';
import 'practice_app.dart' as lib;

greetPerson() {
  print("Enter your name:");
  String name = stdin.readLineSync()!;
  while (name.isEmpty) {
    print("Invalid input. Enter your name:");
    name = stdin.readLineSync()!;
  }

  String trimmedName = (name).trim();
  print("Hi $trimmedName! Have an awesome day :)");
}

getRandomPasswordExercise() {
  print("To generate a random password, Enter length of password:");
  String pwLength = stdin.readLineSync()!;
  while (!lib.isInputValidNumeric(pwLength)) {
    print("Invalid Input. Enter length of password:");
    pwLength = stdin.readLineSync()!;
  }

  print("Password Generated: $generateRandomPassword(int.parse(pwLength))}");
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
  String radius = stdin.readLineSync()!;
  while (!lib.isInputValidDouble(radius)) {
    print("Input valid. Enter radius:");
    radius = stdin.readLineSync()!;
  }

  double area = calculateCircleArea(double.parse(radius));
  print('Area of the circle: $area');
}

double calculateCircleArea(double radius) {
  const double pi = 3.14159;
  return pi * radius * radius;
}

getPowerOfNumberExcercise() {
  print("To compute power of a number, Enter base:");
  String baseNumber = stdin.readLineSync()!;
  while (!lib.isInputValidNumeric(baseNumber)) {
    print("Input valid. Enter base:");
    baseNumber = stdin.readLineSync()!;
  }

  print("Enter exponent:");
  String exponentNum = stdin.readLineSync()!;
  while (!lib.isInputValidNumeric(exponentNum)) {
    print("Input valid. Enter exponent:");
    exponentNum = stdin.readLineSync()!;
  }

  int base = int.parse(baseNumber);
  int exponent = int.parse(exponentNum);
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
  if (num1 >= num2 && num1 >= num3) {
    return num1;
  } else if (num2 >= num1 && num2 >= num3) {
    return num2;
  } else {
    return num3;
  }
}

bool createUser({required String name, required int age, bool isActive = true}) {
  return true;
}

double calculateRectangleArea({double length = 1, double width = 1}) {
  return length * width;
}