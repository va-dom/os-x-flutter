import 'dart:math';
import 'dart:io';

class Address {
  late String address;

  void printAddress() {
    print("Address : $address");
  }
}

void printNum(int? number) => print("Number: ${number ?? 0}");

int? generateRandom() => Random().nextBool() ? 100 : null;

bool executePractice7() {
  print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
  print
  ( '''*=============================================================*
||                    PRACTICE 2                             ||  
||               (Null Safety in Dart)                       ||  
*=============================================================*''');
  //Question 1
  print("\n==================Question 1==================");
  print("What is the purpose of the ? operator in Dart null safety?");
  print("'?' operator declares that a variable is nullable.");

  //Question 2
  print("\n==================Question 2==================");
  print("Create a late variable named address, assign a US value to it and print it.");
  Address add1 = Address();
  add1.address = "US";
  add1.printAddress();

  //Question 3
  print("\n==================Question 3==================");
  print("How do you declare a nullable type in Dart null safety?");
  print("You can decalare a nullable type by typing '?' after the data type (e.g. int?)");

  //Question 4
  print("\n==================Question 4==================");
  print("Write a program in a dart to create an age variable and assign a null value to it using ?.");
  int? age;
  age = null;
  print("Age: $age");

  //Question 5
  print("\n==================Question 5==================");
  print("Write a function that accepts a nullable int parameter and returns 0 if the value is null using null coalescing operator ??.");
  printNum(2);
  printNum(null);

  //Question 6
  print("\n==================Question 6==================");
  print('''Write a function named generateRandom() in dart that randomly returns 100 or null. 
  Also, assign a return value of the function to a variable named status that can’t be null. 
  Give status a default value of 0, if generateRandom() function returns null.''');
  int? status = generateRandom() ?? 0;
  print("Status : $status");

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
