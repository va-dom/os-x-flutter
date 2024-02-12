import 'dart:io';

const jaysel = "Jaysel Duran";
const declaredNum = 7;

String getMenu() {
  return """
  Hello to Jaysel\'s playground!
  What exercise do you want to check?
  [1] Practice 1
  [2] Practice 2
  [3] Practice 3
  [4] Practice 4
  [5] Practice 5
  [6] Practice 6
  [7] Practice 7
  [8] Practice 8""";
}

bool isInputValidNumeric(String val) {
  return val.isNotEmpty ||
    isNumeric(val);
}

bool isInputValidDouble(String val) {
  return val.isNotEmpty ||
    isDouble(val);
}

bool isDouble(String str) {
  RegExp _double = RegExp(r'^(-?)(0|([1-9][0-9]*))(\\.[0-9]+)?$');
  return _double.hasMatch(str);
}

bool isNumeric(String str) {
  RegExp _numeric = RegExp(r'^-?[0-9]+$');
  return _numeric.hasMatch(str);
}

getInterest() {
  print("To compute the interest, please provide p, t, and r values. Enter p:");
  String p = stdin.readLineSync()!;
  while (!isInputValidDouble(p)) {
    print("Input valid p:");
    p = stdin.readLineSync()!;
  }

  print("Enter t:");
  String t = stdin.readLineSync()!;
  while (!isInputValidDouble(t)) {
    print("Input valid t:");
    t = stdin.readLineSync()!;
  }

  print("Enter r:");
  String r = stdin.readLineSync()!;
  while (!isInputValidDouble(r)) {
    print("Input valid r:");
    r = stdin.readLineSync()!;
  }

  double interest = double.parse(p) * double.parse(t) * double.parse(r) / 100;
  print("Interest = ${interest.toStringAsFixed(2)}.");
}

getSquareRoot() {
  print("Enter a number:");
  String val = stdin.readLineSync()!;
  while (!isInputValidNumeric(val)) {
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
  print("Hi $trimmedName! Have an awesome day :)");
}

getQuotientAndRemainder() {
  print("Enter the dividend: ");
  String dividend = stdin.readLineSync()!;
  while (!isInputValidNumeric(dividend)) {
    print("Input a valid dividend:");
    dividend = stdin.readLineSync()!;
  }


  print("Enter the divisor: ");
  String divisor = stdin.readLineSync()!;
  while (!isInputValidNumeric(divisor)) {
    print("Input a valid divisor:");
    divisor = stdin.readLineSync()!;
  }

  int quotient = int.parse(dividend) ~/ int.parse(divisor);
  int remainder = int.parse(dividend) % int.parse(divisor);

  print("The quotient of $dividend\/$divisor is: $quotient with remainder of: $remainder");
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
  print(("     H E L L O ! :D     ").trim());
}

getTotalBill() {
  print("What is your total bill?: ");
  String bill = stdin.readLineSync()!;
  while (!isInputValidDouble(bill)) {
    print("Input a valid value:");
    bill = stdin.readLineSync()!;
  }

  print("Ilan kayong nagfoodtrip?: ");
  String pax = stdin.readLineSync()!;
  while (!isInputValidNumeric(pax)) {
    print("Input a valid number of pax:");
    pax = stdin.readLineSync()!;
  }

  double totalShare = double.parse(bill) / int.parse(pax);
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