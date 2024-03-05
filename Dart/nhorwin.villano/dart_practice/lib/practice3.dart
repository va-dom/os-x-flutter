import 'dart:math';

// Fuction for Question 1
void printOwnName() {
  print("Nhorwin John Villano");
}

// Fuction for Question 2
void printEvenNum(int start, int end) {
  for (int i = start; i <= end; i++) {
    if (isEven(i)) {
      print(i);
    }
  }
}

// Fuction for Question 3
void greet(String name) {
  print("Hello $name");
}

// Fuction for Question 4
String generateRandomPassword(int length) {
  String lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
  String uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String digits = '0123456789';
  String specialCharacters = '!@#\$%^&*()-_+=';
  String allCharacters =
      lowercaseLetters + uppercaseLetters + digits + specialCharacters;
  String password = '';

  Random random = Random();

  for (int i = 1; i <= length; i++) {
    int randomIndex = random.nextInt(allCharacters.length);
    password += allCharacters[randomIndex];
  }
  return password;
  // int password = Random().hashCode;
  // return password;
}

// Fuction for Question 5
void getCircleArea(double r) {
  const double pi = 3.14;
  double area = pi * r * r;
  print("The area is $area");
}

// Fuction for Question 6
String reverseString(String str) {
  return str.split('').reversed.join();
}

// Fuction for Question 7
num calculatePower(num base, num exponent) {
  return pow(base, exponent);
}

// Fuction for Question 8
int add(int num1, int num2) {
  return num1 + num2;
}

// Fuction for Question 9
int getLargestNumber(int num1, int num2, int num3) {
  int maxnum = max(max(num1, num2), num3);
  return maxnum;
}

// Fuction for Question 10
bool isEven(int num) => (num % 2 == 0) ? true : false;

// Fuction for Question 11
void createUser(String name, int age, {bool isActive = true}) {
  print("Name : $name");
  print("Age : $age");
  print("isActive : $isActive");
}

// Fuction for Question 12
void calculateArea({int length = 1, int width = 1}) {
  print("Length : $length");
  print("Width : $width");
  int area = length * width;
  print("Area : $area");
}
