import 'dart:io';
import 'dart:math';

int calculate() {
  return 6 * 7;
}

Future<String> getCitiesCSV() async {
  String filePath = 'assets/cities.csv';
  File file = File(filePath);

  if (!file.existsSync()) {
    throw 'File not found';
  }

  return Future.value(file.readAsString());
}

Future<String> getDelayedMessage(String message, int delay) {
  return Future.delayed(Duration(seconds: delay), () => message);
}

Future<num> sum(num num1, num num2) {
  return Future.value(num1 + num2);
}

// Using async await to simulate a delay
Future<int> delayedSum(int num1, int num2) async {
  Random random = Random();
  bool hasError = random.nextBool();
  await Future.delayed(Duration(seconds: 3));
  if (!hasError) {
    return Future.value(num1 + num2);
  } else {
    throw "An error has occurred!";
  }
}

// Immutably returns a sorted list
Future<List<String>> sortList(List<String> list) {
  List<String> sortedList = List<String>.from(list);
  sortedList.sort();
  return Future.value(sortedList);
}

Future<List<int>> multiplyListBy2(List<int> list) {
  List<int> modifiedList = List<int>.from(list);
  for (int i = 0; i < modifiedList.length; i++) {
    modifiedList[i] *= 2;
  }
  return Future.value(modifiedList);
}

Future<String> reverseString(String text) {
  List<String> characters = text.split('');
  List<String> reversedCharacters = characters.reversed.toList();
  String reversedString = reversedCharacters.join();
  return Future.value(reversedString);
}