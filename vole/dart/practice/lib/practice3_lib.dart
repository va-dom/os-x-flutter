import 'dart:math';

// Returns a name: John Doe
String getName() {
  return "John Doe";
}

/// Get even numbers between 2 numbers
List<int> getEvenNumbersInRange(int num1, int num2) {
  List<int> evenNumbers = [];
  for(int i = num1; i <= num2; i++) {
    if (i % 2 == 0) {
      evenNumbers.add(i);
    }
  }
  return evenNumbers; 
}

/// Print a greeting
void printGreeting(String name) {
  print("Hello, $name");
}

/// Generate a password
String generatePassword({int length = 16}) {
  String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String lower = 'abcdefghijklmnopqrstuvwxyz';
  String numbers = '1234567890';
  String symbols = '!@#\$%';
  String seed = upper + lower + numbers + symbols;
  String password = '';
  List<String> list = seed.split('').toList();
  Random rand = Random();

  for (int i = 0; i < length; i++) {
    int index = rand.nextInt(list.length);
    password += list[index];
  }
  return password;
}

/// Calculate the area of a circle
double getCircleArea(double r) {
  return pi * r * r;
}

/// Reverse a text
String reverseText(String text) {
  return text.split('').reversed.join();
}

/// Get the power of a number
num getPower(int num, int exponent) {
  return pow(num, exponent);
}

/// Adds 2 numbers
num add(num num1, num num2) {
  return num1 + num2;
}

/// Get the largest number between 3 numbers
num maxNumber(num num1, num num2, num num3) {
  String strNumbers = "$num1,$num2,$num3";
  List<int> numbers = strNumbers.split(',').map((n) => int.parse(n)).toList();
  return numbers.reduce(max);
}

/// Checks if a number is even
bool isEven(int num) {
  return num % 2 == 0 ? true : false;
}

Map<String, String> createUser(String name, int age, {bool isActive = true}) {
  return {
    'name': name,
    'age': age.toString(),
    'isActive': isActive.toString()
  };
}

num calculateArea({num length = 1, num width = 1}) {
  return length * width;
}

/// Checks if string is numeric
bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}