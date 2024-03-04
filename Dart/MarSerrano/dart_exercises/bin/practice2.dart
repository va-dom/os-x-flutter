import 'dart:io';

bool isStringOnlyLetters(String str) {
  return str.trim().isNotEmpty && str.split('').every((char) => RegExp(r'^[a-zA-Z]+$').hasMatch(char));
}

bool executePractice2() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print
  ( '''*=============================================================*
||                    PRACTICE 2                             ||  
||              (Conditions and Loops)                       ||  
*=============================================================*''');
  //Question 1
  print("\n==================Question 1==================");
  print("Write a dart program to check if the number is odd or even.");
  try {
    print("Enter a number:");
    int num = int.parse(stdin.readLineSync()!);
    if(num%2 == 0) {
      print("Your number is an even number.");
    }
    else {
      print("Your number is an odd number.");
    }
  }
  on FormatException {
    print("Invalid input. Accepts numbers only.");
  }

  //Question 2
  print("\n==================Question 2==================");
  print("Write a dart program to check whether a character is a vowel or consonant.");
  bool isChecking = true;
  while(isChecking) {
    String char = stdin.readLineSync()!;
    print("Enter a character:");
    if (char.length != 1) {
      print("Invalid input. Input one (1) character.");
      continue;
    }
    else if (!isStringOnlyLetters(char)) {
      print("Invalid input. Input alphabet characters only.");
      continue;
    }
    else {
      if(char == 'a' || char == 'e' || char == 'i' || char == 'o' || char == 'u' ) {
        print("Your character is a vowel.");
        isChecking = false;
        break;
      }
      else {
        print("Your character is a consonant.");
        isChecking = false;
        break;
      }
    }
  }
  
  
  //Question 3
  print("\n==================Question 3==================");
  print("Write a dart program to check whether a number is positive, negative, or zero.");
  try {
    print("Enter a number:");
    int num1 = int.parse(stdin.readLineSync()!);
    if(num1 == 0) {
      print("Your number is a zero.");
    }
    else if (num1 > 0) {
      print("Your number is positive.");
    }
    else {
      print("Your number is negative.");
    }

  }
  on FormatException {
    print("Invalid input. Accepts numbers only.");
  }
  
  //Question 4
  print("\n==================Question 4==================");
  print("Write a dart program to print your name 100 times.");
  String name = "Mar";
  for(int i = 0; i < 100; i++) {
    print("${i+1} $name");
  }
  //Question 5
  print("\n==================Question 5==================");
  print("Write a dart program to calculate the sum of natural numbers.");
  try {    
    print("Enter a natural number:");
    int n = int.parse(stdin.readLineSync()!);
    if (n < 0){
      throw FormatException();
    }
    else {
       int sum = 0;
      for(int i = 0; i <= n; i++) {
        sum = sum + i;
      }
      print("Sum of all natural numbers: $sum");
    }
  }
  on FormatException {
    print("Invalid input. Accepts positive natural numbers only.");
  }

  //Question 6
  print("\n==================Question 6==================");
  print("Write a dart program to generate multiplication tables of 5.");
  print("Multiplication Table of 5:");
  for(int i = 1; i <=10; i++) {
    print("${i*5}");
  }

  //Question 7
  print("\n==================Question 7==================");
  print("Write a dart program to generate multiplication tables of 1-9.");
  try {
    print("Enter a number from 1-9:");
    int x = int.parse(stdin.readLineSync()!);
    if( x < 1 || x > 9){
      print("Invalid input.");
    }
    else {
      print("Multiplication Table of $x:");
      for(int i = 1; i <=10; i++) {
        print("${i*x}");
      }
    }
  }
  on FormatException {
    print("Invalid input. Accepts numbers only.");
  }
  

  //Question 8
  print("\n==================Question 8==================");
  print("Write a dart program to create a simple calculator that performs addition, subtraction, multiplication, and division.");
  try {
    print("Enter first number:");
    int num2 = int.parse(stdin.readLineSync()!);
    print("Enter second number:");
    int num3 = int.parse(stdin.readLineSync()!);
    String message = '''Select an operation:
    a. Addition
    b. Subtraction
    c. Multiplication
    d. Division ''';
    print(message);
    String? operation = stdin.readLineSync();
    switch(operation) {
      case 'a':
        print("Sum: ${num2 + num3}");
        break;
      case 'b':
        print("Difference: ${num2 - num3}");
        break;
      case 'c':
        print("Product: ${num2 * num3}");
        break;
      case 'd':
        print("Quotient: ${num2/num3}");
        break;
      default:
        print("Invalid Operation");
        break;
    }
  }
  on FormatException {
    print("Invalid input. Accepts numbers only.");
  }
  

  //Question 9
  print("\n==================Question 9==================");
  print("Write a dart program to print 1 to 100 but not 41.");
  int y = 1;
  while(y <= 100) {
    if(y == 41) {
      y++;
      continue;
    }
    print(y);
    y++;
  }

  //Continue Program
  print("\nGo back to Main Menu? (Y/N)");
  String mainMenu = stdin.readLineSync()!;
  if(mainMenu == 'Y' || mainMenu == 'y') {
    return true;
  }
  else {
    return false;
  }
}
