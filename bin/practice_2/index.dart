import 'dart:io';

// Write a dart program to check if the number is odd or even.
void isEvenOrOdd() {
  print('Enter a number:');
  String? number = stdin.readLineSync();

  if (number != null) {
    int num = int.parse(number);

    if (num % 2 == 0) {
      print('$num is even');
    } else {
      print('$num is odd');
    }
  }
}

// Write a dart program to check whether a character is a vowel or consonant.
void checkVowelOrConsonant() {
  print('Enter a character:');
  String? character = stdin.readLineSync();

  if (character != null) {
    List<String> vowels = ['a', 'e', 'i', 'o', 'u'];

    bool isVowel = vowels.any((v) => v == character);
    print(isVowel ? '$character is a vowel' : '$character is a consonant');
  } else {
    throw Exception('Invalid input');
  }
}

// Write a dart program to check whether a number is positive, negative, or zero.
void checkNumber() {
  print('Enter a number:');
  String? number = stdin.readLineSync();

  if (number != null) {
    int num = int.parse(number);

    if (num > 0) {
      print('$num is positive');
    } else if (num < 0) {
      print('$num is negative');
    } else {
      print('$num is zero');
    }
  } else {
    throw Exception('Invalid input');
  }
}

// Write a dart program to print your name 100 times.
void printName100x() {
  const count = 100;
  const name = "Robertson";

  for (var i = 1; i <= count; i++) {
    print('$i: $name');
  }
}

// Write a dart program to calculate the sum of natural numbers.
void calculateSumOfNaturalNumbers() {
  print('Enter a number:');
  String? number = stdin.readLineSync();

  if (number != null) {
    int newNumber = int.parse(number), sum = 0;

    for (var i = 1; i <= newNumber; i++) {
      sum += i;

      print(sum);
    }
  } else {
    throw Exception('Invalid input');
  }
}

// Write a dart program to generate multiplication tables of 5.
void multiplicationOf5() {
  const count = 10;
  for (int i = 1; i <= count; i++) {
    int product = 5 * i;

    print("5 x $i = $product");
  }
}

// Write a dart program to generate multiplication tables of 1-9.
void multiplicationOf1To9() {
  const count = 9;
  for (var i = 1; i <= count; i++) {
    for (var j = 1; j <= count; j++) {
      print('$i x $j = ${i * j}');
    }
  }
}

// Write a dart program to create a simple calculator that performs addition, subtraction, multiplication, and division.
void simpleCalculator() {
  print("Enter first number: ");
  String? userInput = stdin.readLineSync();

  if (userInput != null) {
    int num1 = int.parse(userInput);

    print("Enter second number: ");
    String? userInput2 = stdin.readLineSync();
    if (userInput2 != null) {
      int num2 = int.parse(userInput2);

      print("Addition: ${num1 + num2}");
      print("Subtraction: ${num1 - num2}");
      print("Multiplication: ${num1 * num2}");
      print("Division: ${num1 / num2}");
    } else {
      throw Exception('Invalid input');
    }
  } else {
    throw Exception('Invalid input');
  }
}

// Write a dart program to print 1 to 100 but not 41.
void print1To100ButNot41() {
  for (var i = 1; i <= 100; i++) {
    if (i == 41) {
      continue;
    }

    print(i);
  }
}
