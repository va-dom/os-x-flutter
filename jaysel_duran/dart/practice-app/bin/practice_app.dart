import 'dart:io';

import 'practices/practice_1.dart' as practice1;
import 'practices/practice_2.dart' as practice2;
import 'practices/practice_3.dart' as practice3;
import 'practices/practice_4.dart' as practice4;
import 'practices/practice_5.dart' as practice5;
import 'practices/practice_6.dart' as practice6;
import 'practices/practice_7.dart' as practice7;
import 'practices/practice_8.dart' as practice8;
import '../lib/practice_app.dart' as mainFunctions;

void main(List<String> arguments) {
  print(mainFunctions.getMenu());


  String inSelectedexercise = stdin.readLineSync()!;

  // Checks if input value is valid. (not empty, is numeric, is existing exercise)
  while (
    inSelectedexercise.isEmpty ||
    !(mainFunctions.isNumeric(inSelectedexercise)) ||
    int.parse(inSelectedexercise) > 8
  ) {
    print("Exercise not found. What exercise do you want to check?");
    inSelectedexercise = stdin.readLineSync()!;
  }

  int selectedExercise = int.parse(inSelectedexercise);
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
    case 5:
      practice5.runPractice();
      break;
    case 6:
      practice6.runPractice();
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
