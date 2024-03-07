import 'dart:io';
import 'practice_app.dart' as main_util;

getInterest() {
  print("To compute the interest, please provide p, t, and r values. Enter p:");
  double p = main_util.getDoubleInput();

  print("Enter t:");
  double t = main_util.getDoubleInput();

  print("Enter r:");
  double r = main_util.getDoubleInput();

  double interest = p * t * r / 100;
  print("Interest = ${interest.toStringAsFixed(2)}.");
}

getSquareRoot() {
  print("Enter a number:");
  int val = main_util.getNumericInput();
  int square = val * val;
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

  String trimmedName = ("$firstNameVal $lastNameVal").trim().capitalizeByWord();
  print("Hi $trimmedName! Have an awesome day :)");
}

getQuotientAndRemainder() {
  print("Enter the dividend: ");
  int dividend = main_util.getNumericInput();


  print("Enter the divisor: ");
  int divisor = main_util.getNumericInput();

  int quotient = dividend ~/ divisor;
  int remainder = dividend % divisor;

  print("The quotient of $dividend/$divisor is: $quotient with remainder of: $remainder");
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
  print(("     HELLO! :D     ").trim());
}

getTotalBill() {
  print("What is your total bill?: ");
  double bill = main_util.getDoubleInput();

  print("Ilan kayong nagfoodtrip?: ");
  int pax = main_util.getNumericInput();

  double totalShare = bill / pax;
  String trimmedBill = totalShare.toStringAsFixed(2);
  print("Ang ambagan niyo po ay: $trimmedBill");
}

double calculateTime(double distanceKm, double speedKmPerHour) {
  // Calculate time taken in hours
  double timeInHours = distanceKm / speedKmPerHour;

  // Convert time from hours to minutes
  double timeInMinutes = timeInHours * 60;

  return timeInMinutes;
}