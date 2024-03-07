import 'dart:math';
import 'dart:io';
import 'package:dart_practices/style.dart' as style;

void runFunctions() {
  print('----- Start: Dart Practice #7: Q1 -----');
  print(
      '----- Create a late variable named address, assign a US value to it and print it -----');
  stdout.write(style.Style.green);
  printAddress();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #7: Q1 ----- \n');

  print('----- Start: Dart Practice #7: Q2 -----');
  print('----- How do you declare a nullable type in Dart null safety? -----');
  stdout.write(style.Style.green);
  printNullableType();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #7: Q2 ----- \n');

  print('----- Start: Dart Practice #7: Q3 -----');
  print(
      '----- Write a program in a dart to create an age variable and assign a null value to it using ?. -----');
  stdout.write(style.Style.green);
  printAge();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #7: Q3 ----- \n');

  print('----- Start: Dart Practice #7: Q4 -----');
  print(
      '----- Write a function that accepts a nullable int parameter and returns 0 if the value is null using null coalescing operator ??. -----');
  stdout.write(style.Style.green);
  nullCoalescingOperator(null);
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #7: Q4 ----- \n');

  print('----- Start: Dart Practice #7: Q5 -----');
  print(
      '----- Write a function named generateRandom() in dart that randomly returns 100 or null. Also, assign a return value of the function to a variable named status that can’t be null. Give status a default value of 0, if generateRandom() function returns null. -----');
  stdout.write(style.Style.green);
  triggerGenerateRandom();
  stdout.write(style.Style.reset);
  print('----- End: Dart Practice #7: Q5 ----- \n');
}

// Create a late variable named address, assign a US value to it and print it.
void printAddress() {
  late String address;
  address = 'US';
  print(address);
}

// How do you declare a nullable type in Dart null safety?
void printNullableType() {
  String? address;

  print(address);
}

// Write a program in a dart to create an age variable and assign a null value to it using ?.
void printAge() {
  int? age;
  print(age);
}

// Write a function that accepts a nullable int parameter and returns 0 if the value is null using null coalescing operator ??.
void nullCoalescingOperator(int? num) {
  int result = num ?? 0;
  print(result);
}

int? generateRandom() {
  return Random().nextBool() ? 100 : null;
}

// Write a function named generateRandom() in dart that randomly returns 100 or null. Also, assign a return value of the function to a variable named status that can’t be null. Give status a default value of 0, if generateRandom() function returns null.
void triggerGenerateRandom() {
  int status = generateRandom() ?? 0;

  print(status);
}
