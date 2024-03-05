import 'package:dart_practice/practice2_8.dart' as practice2_8_lib;
import 'package:dart_practice/practice1.dart' as practice1_lib;

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
    practice2_8_lib.displayOptions();
    option = practice1_lib.inputInteger();
    if (option == 5) {
      break;
    }
    print("Enter value:");
    value = practice1_lib.inputDouble();

    switch (option) {
      case 1:
        total = practice2_8_lib.add(total, value);
        break;
      case 2:
        total = practice2_8_lib.subtract(total, value);
        break;
      case 3:
        total = practice2_8_lib.multiply(total, value);
        break;
      case 4:
        total = practice2_8_lib.divide(total, value);
        break;
      case 5:
        break;
      default:
        print("Invalid Input!");
    }
  } while (option != 5);
}
