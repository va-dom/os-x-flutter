import 'package:dart_practices/practice_1/index.dart' as p1;
import 'package:dart_practices/practice_2/index.dart' as p2;
import 'package:dart_practices/practice_3/index.dart' as p3;
import 'package:dart_practices/practice_4/index.dart' as p4;
import 'package:dart_practices/practice_7/index.dart' as p7;
import 'package:dart_practices/practice_8/index.dart' as p8;
import 'dart:io';

void main(List<String> arguments) {
  print('Practices: \n');
  print('1. Practice 1');
  print('2. Practice 2');
  print('3. Practice 3');
  print('4. Practice 4');
  print('5. Practice 7');
  print('6. Practice 8');

  print('Select an option:');
  String? option = stdin.readLineSync();
  if (option != null) {
    switch (int.parse(option.trim())) {
      case 1:
        p1.runFunctions();
        break;
      case 2:
        p2.runFunctions();
        break;
      case 3:
        p3.runFunctions();
        break;
      case 4:
        p4.runFunctions();
        break;
      case 5:
        p7.runFunctions();
        break;
      case 6:
        p8.runFunctions();
        break;

      default:
        stdout.write('\u001B[31m');
        stdout.write('Invalid input');
    }
  }
}
