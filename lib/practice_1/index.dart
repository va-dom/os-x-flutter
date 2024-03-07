import 'dart:io';
import 'package:dart_practices/style.dart' as style;
import 'package:dart_practices/calculation.dart' as calculation;

// Main function
void runFunctions() {
  print('*** Start: Dart Practice #1: Q1 ***');
  stdout.write(style.Style.yellowish);
  print('*** Write a program to print your name in Dart ***');
  stdout.write(style.Style.reset);

  stdout.write(style.Style.green);
  printName();
  stdout.write(style.Style.reset);
  print('*** End: Dart Practice #1: Q1 *** \n');

  print('*** Start: Dart Practice #1: Q2 ***');
  stdout.write(style.Style.yellowish);
  print(
      '*** Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes ***');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  introduce();
  stdout.write(style.Style.reset);
  print('*** End: Dart Practice #1: Q2 *** \n');

  print('*** Start: Dart Practice #1: Q3 ***');
  stdout.write(style.Style.yellowish);
  print('*** Declare constant type of int set value 7 ***');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  constType();
  stdout.write(style.Style.reset);
  print('*** End: Dart Practice #1: Q3 *** \n');

  print('*** Start: Dart Practice #1: Q4 ***');
  stdout.write(style.Style.yellowish);
  print(
      '*** Write a program in Dart that finds simple interest. Formula= (p * t * r) / 100 ***');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  simpleInterest();
  stdout.write(style.Style.reset);
  print('*** End: Dart Practice #1: Q4 *** \n');

  print('*** Start: Dart Practice #1: Q5 ***');
  stdout.write(style.Style.yellowish);
  print(
      '*** Write a program to print a square of a number using user input ***');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  squareOfANumber();
  stdout.write(style.Style.reset);
  print('*** End: Dart Practice #1: Q5 *** \n');

  print('*** Start: Dart Practice #1: Q6 ***');
  stdout.write(style.Style.yellowish);
  print(
      '*** Write a program to print full name of a from first name and last name using user input ***');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  displayFullName();
  stdout.write(style.Style.reset);
  print('*** End: Dart Practice #1: Q6 *** \n');

  print('*** Start: Dart Practice #1: Q7 ***');
  stdout.write(style.Style.yellowish);
  print(
      '*** Write a program to find quotient and remainder of two integers ***');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  findQuotientAndRemainder(10, 5);
  stdout.write(style.Style.reset);
  print('*** End: Dart Practice #1: Q7 *** \n');

  print('*** Start: Dart Practice #1: Q8 ***');
  stdout.write(style.Style.yellowish);
  print('*** Write a program to swap two numbers ***');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  swapTwoNumbers();
  stdout.write(style.Style.reset);
  print('*** End: Dart Practice #1: Q8 *** \n');

  print('*** Start: Dart Practice #1: Q9 ***');
  stdout.write(style.Style.yellowish);
  print('*** Write a program to swap two numbers ***');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  removeWhiteSpacesFromString();
  stdout.write(style.Style.reset);
  print('*** End: Dart Practice #1: Q9 *** \n');

  print('*** Start: Dart Practice #1: Q10 ***');
  stdout.write(style.Style.yellowish);
  print('*** Write a program to swap two numbers ***');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  convertStringToInt();
  stdout.write(style.Style.reset);
  print('*** End: Dart Practice #1: Q10 *** \n');

  print('*** Start: Dart Practice #1: Q11 ***');
  stdout.write(style.Style.yellowish);
  print('*** Write a program to swap two numbers ***');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  splitBill();
  stdout.write(style.Style.reset);
  print('*** End: Dart Practice #1: Q11 *** \n');

  print('*** Start: Dart Practice #1: Q12 ***');
  stdout.write(style.Style.yellowish);
  print('*** Write a program to swap two numbers ***');
  stdout.write(style.Style.reset);
  stdout.write(style.Style.green);
  calculateTimeToOffice();
  stdout.write(style.Style.reset);
  print('*** End: Dart Practice #1: Q12 *** \n');
}

// Write a program to print your name in Dart.
void printName() {
  print('Robertson Morales');
}

// Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.
void introduce() {
  String name = 'John Doe';
  print('Hello I am "$name"');
  print("Hello I'm " '"$name"' "");
}

// Declare constant type of int set value 7.
void constType() {
  const int num = 7;
  print(num);
}

// Write a program in Dart that finds simple interest. Formula= (p * t * r) / 100
void simpleInterest() {
  double p = 1000,
      t = 2,
      r = 5,
      result = calculation.calcSimpleInterest(p, t, r);
  print('The simple interest is: $result');
}

// Write a program to print a square of a number using user input.
void squareOfANumber() {
  print('Enter a number: ');
  String? userInput = stdin.readLineSync();

  if (userInput != null && int.tryParse(userInput) != null) {
    int number = int.parse(userInput), result = calculation.getSquare(number);

    print('The square of $userInput is: $result');
  } else {
    throw Exception('Invalid input');
  }
}

// Write a program to print full name of a from first name and last name using user input.
void displayFullName() {
  print('Enter your first name: ');
  String? firstName = stdin.readLineSync();
  print('Enter your last name: ');
  String? lastName = stdin.readLineSync();

  if (firstName != null && lastName != null) {
    print('Your full name is: $firstName $lastName');
  } else {
    throw Exception('Invalid input');
  }
}

// Write a program to find quotient and remainder of two integers.
void findQuotientAndRemainder(dividend, divisor) {
  int quotient = calculation.getQuotient(dividend, divisor),
      remainder = calculation.getRemainder(dividend, divisor);

  print('Quotient: $quotient');
  print('Remainder: $remainder');
}

// Write a program to swap two numbers.
void swapTwoNumbers() {
  List<int> numbers = [1, 2];
  print(numbers.reversed);
}

// Write a program in Dart to remove all white spaces from String.
void removeWhiteSpacesFromString() {
  final name = '\tRobertson Morales\n'.trim();
  print(name);
}

// Write a Dart program to convert String to int.
void convertStringToInt() {
  String str = '123';
  int num = int.parse(str);

  print(num);
}

// Suppose, you often go to restaurant with friends and you have to split amount of bill. Write a program to calculate split amount of bill. Formula= (total bill amount) / number of people
void splitBill() {
  print('Enter total bill amount:');
  String? totalBill = stdin.readLineSync();
  print('Enter number of people: ');
  String? numberOfPeople = stdin.readLineSync();

  if (totalBill != null && numberOfPeople != null) {
    double bill = double.parse(totalBill),
        people = double.parse(numberOfPeople);
    double result = bill / people;

    print('Split amount of bill is: $result');
  } else {
    throw Exception('Invalid input');
  }
}

// Suppose, your distance to office from home is 25 km and you travel 40 km per hour.
// Write a program to calculate time taken to reach office in minutes. Formula= (distance) / (speed)
void calculateTimeToOffice() {
  const int distance = 25; // km
  const int speed = 40; // km/h

  double time = calculation.calcDistanceAndSpeed(distance, speed),
      minutes = (time * 60);

  print('It would take approximately $minutes minutes to reach the office.');
}
