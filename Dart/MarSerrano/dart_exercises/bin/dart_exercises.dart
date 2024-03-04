import 'practice1.dart' as practice1;
import 'practice2.dart' as practice2;
import 'practice3.dart' as practice3;
import 'practice4.dart' as practice4;
import 'practice7.dart' as practice7;
import 'practice8.dart' as practice8;
import 'dart:io';



void main(List<String> arguments) {
  bool isContinue = true;
  while(isContinue){
    print("\x1B[2J\x1B[0;0H"); // clear entire screen, move cursor to 0;0
    print
  ( '''*=============================================================*
||                    DART EXERCISES                         ||  
*=============================================================*''');
    print('''Please select which practice exercise to run:
    a. Practice 1 (Introduction and Basics)
    b. Practice 2 (Conditions and Loops)
    c. Practice 3 (Functions in Dart)
    d. Practice 4 (Collections in Dart)
    e. Practice 7 (Null Safety in Dart)
    f. Practice 8 (Asynchronous Programming)
    g. Exit Program''');
    String choice = stdin.readLineSync()!;
    switch(choice) {
      case 'a' || 'A':
        isContinue = practice1.executePractice1();

      case 'b' || 'B':
        isContinue = practice2.executePractice2();

      case 'c' || 'C':
        isContinue = practice3.executePractice3();

      case 'd' || 'D':
        isContinue = practice4.executePractice4();

      case 'e' || 'E':
        isContinue = practice7.executePractice7();

      case 'f' || 'F':
        isContinue = practice8.executePractice8();

      default:
        isContinue = false;
        break;
    }

  }
  

  
}
