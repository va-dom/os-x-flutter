import 'dart:io';
import 'package:practice7/practice7.dart' as practice7;

void main(List<String> arguments) {
  print("-----------------------------------------------------------------");
  print(" Questions for Practice 4");
  print(" [1] What is the purpose of the ? operator in Dart null safety?");
  print(" [2] Create a late variable named address, assign a US value to it and print it.");
  print(" [3] How do you declare a nullable type in Dart null safety?");
  print(" [4] Write a program in a dart to create an age variable and assign a null value to it using ?.");
  print(" [5] Write a function that accepts a nullable int parameter and returns 0 if the value is null using null coalescing operator ??.");
  print(" [6] Write a function named generateRandom() in dart that randomly returns 100 or null. Also, assign a return value of the function to a variable named status that can\u2019t be null. Give status a default value of 0, if generateRandom() function returns null.");
  print("-----------------------------------------------------------------");
  stdout.write("Select a Question: ");
  String choice = stdin.readLineSync()!;
  switch (choice) {
    case "1":
      question1();
      break;
    case "2":
      question2();
      break;
    case "3":
      question3();
      break;
    case "4":
      question4();
      break;
    case "5":
      question5();
      break;
    case "6":
      question6();
      break;
    default:
      print("Invalid input! Choice is not in the options!!");
  }
}

void question1() {
  print(" [1] What is the purpose of the ? operator in Dart null safety?");
  print("? is used to declare a nullable variable");
}

void question2() {
  print(" [2] Create a late variable named address, assign a US value to it and print it.");
  late String address;
  address = "Suite 600 512 Conroy Branch, Osinskiberg, CO 64871";
  print("Late address = $address");
}

void question3() {
  print(" [3] How do you declare a nullable type in Dart null safety?");
  print("By using ? after the data type when declaring a variable");
  print("String? name;");
}

void question4() {
  print(" [4] Write a program in a dart to create an age variable and assign a null value to it using ?.");
  int? age;
  print("Variable age = $age");
}

void question5() {
  print(" [5] Write a function that accepts a nullable int parameter and returns 0 if the value is null using null coalescing operator ??.");
  print("Return value: ${practice7.getNumber(null)}");
}

void question6() {
  print(" [6] Write a function named generateRandom() in dart that randomly returns 100 or null. Also, assign a return value of the function to a variable named status that can\u2019t be null. Give status a default value of 0, if generateRandom() function returns null.");
  int status = practice7.generateRandom() ?? 0;
  print("Status = $status");
}