import 'dart:io';

int calculate() {
  return 6 * 7;
}

Future<String> getCitiesCSV() async {
  String filePath = 'assets/cities.csv';
  File file = File(filePath);

  if (!file.existsSync()) {
    throw 'File not found';
  }

  return file.readAsString();
}

Future<String> getDelayedMessage(String message, int delay) {
  return Future.delayed(Duration(seconds: delay), () => message);
}

Future<num> sum(num num1, num num2) async {
  return num1 + num2;
}

Future<int> delayedSum(int num1, int num2) async {
  await Future.delayed(Duration(seconds: 3));
  return num1 + num2;
}

Future<List<String>> sortList(List<String> list) async {
  List<String> sortedList = List<String>.from(list);
  sortedList.sort();
  return sortedList;
}

Future<List<int>> multiplyListBy2(List<int> list) async {
  List<int> modifiedList = List<int>.from(list);
  for (int i = 0; i < modifiedList.length; i++) {
    modifiedList[i] *= 2;
  }
  return modifiedList;
}

Future<String> reverseString(String text) async {
  List<String> characters = text.split('');
  List<String> reversedCharacters = characters.reversed.toList();
  String reversedString = reversedCharacters.join();
  return reversedString;
}