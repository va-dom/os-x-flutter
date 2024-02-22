import 'dart:io';

void displayOptions() {
  print("-Options-");
  print("[1] Add");
  print("[2] Subtract");
  print("[3] Multiply");
  print("[4] Divide");
  print("[5] Exit");
  print("Please choose option");
}

double add(double num1, double num2) {
  return num1 + num2;
}

double subtract(double num1, double num2) {
  return num1 - num2;
}

double multiply(double num1, double num2) {
  return num1 * num2;
}

double divide(double num1, double num2) {
  return num1 / num2;
}

void main() {
  print("---------------------------------------------------");
  print(
      "Write a dart program to create a simple calculator that performs addition, subtraction, multiplication, and division.");
  print("---------------------------------------------------");

  double total = 0;
  double value = 0;
  int option;

  do {
    print("Total: $total");
    displayOptions();
    option = int.parse(stdin.readLineSync()!);
    if (option == 5) {
      break;
    }
    print("Enter value:");
    value = double.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        total = add(total, value);
        break;
      case 2:
        total = subtract(total, value);
        break;
      case 3:
        total = multiply(total, value);
        break;
      case 4:
        total = divide(total, value);
        break;
      case 5:
        break;
      default:
        print("Invalid Input!");
    }
  } while (option != 5);
}
