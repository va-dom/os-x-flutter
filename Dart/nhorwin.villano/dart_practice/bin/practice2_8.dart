import 'dart:io';
import 'package:dart_practice/practice2_8.dart' as lib;

void runPractice() {
  print("---------------------------------------------------");
  print(
      "Write a dart program to create a simple calculator that performs addition, subtraction, multiplication, and division.");
  print("---------------------------------------------------");

  double total = 0;
  double value = 0;
  int option;

  do {
    print("Total: $total");
    lib.displayOptions();
    option = int.parse(stdin.readLineSync()!);
    if (option == 5) {
      break;
    }
    print("Enter value:");
    value = double.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        total = lib.add(total, value);
        break;
      case 2:
        total = lib.subtract(total, value);
        break;
      case 3:
        total = lib.multiply(total, value);
        break;
      case 4:
        total = lib.divide(total, value);
        break;
      case 5:
        break;
      default:
        print("Invalid Input!");
    }
  } while (option != 5);
}
