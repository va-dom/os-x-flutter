import 'dart:io';

void main() {
  int number;

  print("---------------------------------------------------");
  print("Questions for Practice 2");
  print("---------------------------------------------------");

  print("1. Write a dart program to check if the number is odd or even.");
  print("Enter a number");
  number = int.parse(stdin.readLineSync()!);
  if (number % 2 == 0) {
    print("$number is even");
  } else {
    print("$number is odd");
  }
  print("\n");

  print(
      "2. Write a dart program to check whether a character is a vowel or consonant.");
  print("Enter a letter:");
  String? letter = stdin.readLineSync();
  switch (letter) {
    case "a" || "A":
      print("$letter is vowel");
      break;
    case "e" || "E":
      print("$letter is vowel");
      break;
    case "i" || "I":
      print("$letter is vowel");
      break;
    case "o" || "O":
      print("$letter is vowel");
      break;
    case "u" || "U":
      print("$letter is vowel");
      break;
    default:
      print("$letter is consonant");
  }
  print("\n");

  print(
      "3. Write a dart program to check whether a number is positive, negative, or zero.");
  print("Enter a number");
  number = int.parse(stdin.readLineSync()!);
  if (number > 0) {
    print("$number is positive");
  } else if (number < 0) {
    print("$number is negative");
  } else {
    print("$number is Zero");
  }
  print("\n");

  print("4. Write a dart program to print your name 100 times.");
  for (int i = 1; i <= 100; i++) {
    print("Nhorwin");
  }
  print("\n");

  print("5. Write a dart program to calculate the sum of natural numbers.");
  print("tbd");
  print("\n");

  print("6. Write a dart program to generate multiplication tables of 5.");
  number = 5;
  for (int i = 1; i <= 9; i++) {
    int product = number * i;
    print("$number x $i = $product");
  }
  print("\n");

  print("7. Write a dart program to generate multiplication tables of 1-9.");
  for (int i = 1; i <= 9; i++) {
    for (int j = 1; j <= 9; j++) {
      int product = i * j;
      print("$i x $j = $product");
    }
    print("\n");
  }
  print("\n");

  print("9. Write a dart program to print 1 to 100 but not 41.");
  for (int i = 1; i <= 100; i++) {
    if (i == 41) {
      continue;
    }
    print(i);
  }
  print("\n");
}
