import 'dart:io';
import 'dart_practice_app.dart' as main_func;

getInterest() {
  print("To compute the interest, please provide p, t, and r values. Enter p:");
  String p = stdin.readLineSync()!;
  while (!main_func.isInputValidDouble(p)) {
    print("Input valid p:");
    p = stdin.readLineSync()!;
  }

  print("Enter t:");
  String t = stdin.readLineSync()!;
  while (!main_func.isInputValidDouble(t)) {
    print("Input valid t:");
    t = stdin.readLineSync()!;
  }

  print("Enter r:");
  String r = stdin.readLineSync()!;
  while (!main_func.isInputValidDouble(r)) {
    print("Input valid r:");
    r = stdin.readLineSync()!;
  }

  double interest = double.parse(p) * double.parse(t) * double.parse(r) / 100;
  print("Interest = ${interest.toStringAsFixed(2)}.");
}

getSquareRoot() {
  print("Enter a number:");
  String val = stdin.readLineSync()!;
  while (!main_func.isInputValidNumeric(val)) {
    print("Input a valid number:");
    val = stdin.readLineSync()!;
  }
  int square = int.parse(val) * int.parse(val);
  print("The square of $val is $square");
}

getInputName() {
  print("Enter your first name:");
  String firstNameVal = stdin.readLineSync()!;
  while (firstNameVal.isEmpty) {
    print("Invalid input. Enter your first name:");
    firstNameVal = stdin.readLineSync()!;
  }

  print("Enter your last name:");
  String lastNameVal = stdin.readLineSync()!;
  while (lastNameVal.isEmpty) {
    print("Invalid input. Enter your last name:");
    lastNameVal = stdin.readLineSync()!;
  }

  String trimmedName = ("$firstNameVal $lastNameVal").trim();
  print("Hi $trimmedName! THAT IS THE KOREK! ");
}

getQuotientAndRemainder() {
  print("Enter the dividend: ");
  String dividend = stdin.readLineSync()!;
  while (!main_func.isInputValidNumeric(dividend)) {
    print("Input a valid dividend:");
    dividend = stdin.readLineSync()!;
  }

  print("Enter the divisor: ");
  String divisor = stdin.readLineSync()!;
  while (!main_func.isInputValidNumeric(divisor)) {
    print("Input a valid divisor:");
    divisor = stdin.readLineSync()!;
  }

  int quotient = int.parse(dividend) ~/ int.parse(divisor);
  int remainder = int.parse(dividend) % int.parse(divisor);

  print(
      "The quotient of $dividend/$divisor is: $quotient with remainder of: $remainder");
}

getSwappingNumbers() {
  print("Enter the first number: ");
  int firstNumber = int.parse(stdin.readLineSync()!);

  print("Enter the second number: ");
  int secondNumber = int.parse(stdin.readLineSync()!);

  print("Before swapping:");
  print("First number: $firstNumber");
  print("Second number: $secondNumber");

  // Swapping logic
  int temp = firstNumber;
  firstNumber = secondNumber;
  secondNumber = temp;

  print("\nAfter swapping:");
  print("First number: $firstNumber");
  print("Second number: $secondNumber");
}

printStringWithWhitespaces() {
  print(("     A N N Y E O N G !    ").trim());
}

getTotalBill() {
  print("Enter the total bill amount: ");
  String bill = stdin.readLineSync()!;
  while (!main_func.isInputValidDouble(bill)) {
    print("Input a valid value:");
    bill = stdin.readLineSync()!;
  }

  print("Enter the number of people: ");
  String pax = stdin.readLineSync()!;
  while (!main_func.isInputValidNumeric(pax)) {
    print("Input a valid number of pax:");
    pax = stdin.readLineSync()!;
  }

  double totalShare = double.parse(bill) / int.parse(pax);
  String trimmedBill = totalShare.toStringAsFixed(2);
  print("Split amount per person:  $trimmedBill");
}

double calculateTime(double distanceKm, double speedKmPerHour) {
  // Calculate time taken in hours
  double timeInHours = distanceKm / speedKmPerHour;

  // Convert time from hours to minutes
  double timeInMinutes = timeInHours * 60;

  return timeInMinutes;
}
