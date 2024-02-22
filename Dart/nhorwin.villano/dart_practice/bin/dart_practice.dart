import 'dart:io';
import 'practice1.dart' as practice1;

void main() {
  print("----Select----");
  print("[1] Practice 1");
  print("[2] Practice 2");
  print("[3] Practice 3");
  print("[4] Practice 4");
  print("[5] Practice 7");
  print("[6] Practice 8");
  print("Enter Practice to run: ");
  int? choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      practice1.runPractice();
      break;
    case 2:
      print("-");
      break;
    case 3:
      print("-");
      break;
    case 4:
      print("-");
      break;
    case 5:
      print("-");
      break;
    case 6:
      print("-");
      break;
    case 7:
      print("-");
      break;
    default:
      print("Invalid input!");
      break;
  }
}
