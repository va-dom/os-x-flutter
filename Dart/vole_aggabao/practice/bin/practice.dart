import 'dart:io';
import 'package:practice/practice1.dart' as practice1;
import 'package:practice/practice2.dart' as practice2;
import 'package:practice/practice3.dart' as practice3;
import 'package:practice/practice4.dart' as practice4;

void main() {
  print("-----------------------------------------------------------------");
  print(" Dart Practice App");
  print(" [1] Practice 1");
  print(" [2] Practice 2");
  print(" [3] Practice 3");
  print(" [4] Practice 4");
  stdout.write("Select a Practice: ");
  String choice = stdin.readLineSync()!;
  switch (choice) {
    case "1":
      practice1.run();
      break;
    case "2":
      practice2.run();
      break;
    case "3":
      practice3.run();
      break;
    case "4":
      practice4.run();
      break;
    default:
      print("Invalid input! Choice is not in the options!!");
  }
}