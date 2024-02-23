import 'dart:io';
import 'practice1.dart' as practice1;
import 'practice2.dart' as practice2;
import 'practice2_8.dart' as practice2_8;
import 'practice3.dart' as practice3;
import 'practice4.dart' as practice4;

void main() {
  print("----Select----");
  print("[1] Practice 1");
  print("[2] Practice 2");
  print("[3] Practice 2-8");
  print("[4] Practice 3");
  print("[5] Practice 4");
  print("[6] Practice 5");
  print("Enter Practice to run: ");
  int? choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      practice1.runPractice();
      break;
    case 2:
      practice2.runPractice();
      break;
    case 3:
      practice2_8.runPractice();
      break;
    case 4:
      practice3.runPractice();
      break;
    case 5:
      practice4.runPractice();
      break;
    case 6:
      practice1.runPractice();
      break;
    case 7:
      practice1.runPractice();
      break;
    default:
      print("Invalid input!");
      break;
  }
}
