import 'dart:io';

class Practice {
  late int practice;
  bool ongoing = true;

  void runDemo() {
    while (ongoing) {
      stdout.write("Please select a practice from 1 - 6 to demo: ");
      practice = int.parse(stdin.readLineSync()!);

      switch (practice) {
        case 1:
          {
            // statements;
          }
          break;

        case 2:
          {
            //statements;
          }
          break;

        case 3:
          {
            //statements;
          }
          break;

        case 4:
          {
            //statements;
          }
          break;

        case 5:
          {
            //statements;
          }
          break;

        default:
          {
            //statements;
          }
          break;
      }
    }
  }
}
