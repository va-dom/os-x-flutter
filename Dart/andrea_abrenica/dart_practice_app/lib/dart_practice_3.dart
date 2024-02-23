import 'dart:io';
import 'dart:math' as math;

printEvenNumbers(int start, int end) {
  print('Even numbers between $start and $end:');
  for (int i = start; i <= end; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }
}

printJohn(String name) {
  print("Hello, $name!");
}

String generateRandomPassword({int length = 8}) {
  const String chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#\$%^&*';

  math.Random random = math.Random();
  String password = '';

  for (int i = 0; i < length; i++) {
    password += chars[random.nextInt(chars.length)];
  }

  return password;
}

areaOfCircle() {
  double radius = 7;
  double area = calculateCircleArea(radius);
  print('The area of the circle with radius $radius is $area');
}

double calculateCircleArea(double radius) {
  return math.pi * radius * radius;
}

String reverseString(String rev) {
  return (rev.split('').reversed.join());
}

num calculatePow(num base, num expnt) {
  return math.pow(base, expnt);
}

int add(int num1, int num2) {
  return num1 + num2;
}

int maxNumber(int max1, int max2, int max3) {
  int max = max1;

  if (max2 > max) {
    max = max2;
  }

  if (max3 > max) {
    max = max3;
  }

  return max;
}

bool isEven(int even) {
  return even % 2 == 0;
}
