import 'dart:io';
import 'practices/practice_1.dart' as practice1;
import 'practices/practice_2.dart' as practice2;
import 'practices/practice_3.dart' as practice3;
import 'practices/practice_4.dart' as practice4;
import 'practices/practice_7.dart' as practice7;
import 'practices/practice_8.dart' as practice8;
import 'package:dart_practice_app/dart_practice_app.dart' as lib;

void main(List<String> arguments) {
  print(lib.getMenu());

  String inSelectedPractice = stdin.readLineSync()!;

  // Checks if input value is valid. (not empty, is numeric, is existing exercise)
  while (!lib.isInputValidNumeric(inSelectedPractice) ||
      int.parse(inSelectedPractice) > 8) {
    print("Exercise not found. What exercise do you want to check?");
    inSelectedPractice = stdin.readLineSync()!;
  }

  int selectedExercise = int.parse(inSelectedPractice);
  switch (selectedExercise) {
    case 1:
      practice1.runPractice();
      break;
    case 2:
      practice2.runPractice();
      break;
    case 3:
      practice3.runPractice();
      break;
    case 4:
      practice4.runPractice();
      break;
    case 7:
      practice7.runPractice();
      break;
    case 8:
      practice8.runPractice();
      break;
    default:
      break;
  }
}
