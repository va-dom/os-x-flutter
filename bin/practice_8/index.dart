import 'dart:async';
import 'dart:io';
import '../data/test-data.csv' as csv_file;

// Write a program to print current time after 2 seconds using Future.delayed()
void printCurrentTime() async {
  await Future.delayed(Duration(seconds: 2), () {
    print(DateTime.now());
  });
}

// Write a program in dart that reads csv file and print it’s content.
void readCsvFile() async {
  try {
    File file =
        File('../data/test-data.csv'); // Replace with the path to your CSV file

    if (!file.existsSync()) {
      print('File not found: ${file.path}');
      return;
    }

    var contents = file.readAsStringSync();
    var lines = contents.split('\n');

    // TODO: To fix showing error when dart is executed from command line
    for (var line in lines) {
      dynamic cells = line.split(',');
      int id = cells[0];
      String firstName = cells[1],
          lastName = cells[2],
          email = cells[3],
          gender = cells[4];
      print('---------------------');
      print(id); // index
      print(firstName); // first_name
      print(lastName); // last_name
      print(email); // email
      print(gender); // gender
      print('---------------------');
    }
  } catch (e) {
    print('Error: $e');
  }
}
