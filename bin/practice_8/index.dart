import 'dart:async';
import 'dart:io';

// Write a program to print current time after 2 seconds using Future.delayed()
void printCurrentTime() async {
  await Future.delayed(Duration(seconds: 2), () {
    print(DateTime.now());
  });
}

// Write a program in dart that reads csv file and print it’s content.
void readCsvFile() {
  try {
    File file = File(
        'bin\\data\\test-data.csv'); // Replace with the path to your CSV file

    if (!file.existsSync()) {
      print('File not found: ${file.path}');
      return;
    }

    String contents = file.readAsStringSync();

    print(contents);
  } catch (e) {
    print('Error: $e');
  }
}

// Write a program in dart that uses Future class to perform multiple asynchronous operations, wait for all of them to complete, and then print the results.
void performMultipleAsyncOperations() async {
  List<Future<int>> futures = [
    Future.delayed(Duration(seconds: 1), () => 1),
    Future.delayed(Duration(seconds: 2), () => 2),
    Future.delayed(Duration(seconds: 3), () => 3),
  ];

  List<int> results = await Future.wait(futures);

  print(results);
}

// Write a Dart program to calculate the sum of two numbers using async/await.
void calculateSum() async {
  print('calculating...');

  int num1 = 22,
      num2 = 15,
      sum = await Future.delayed(Duration(seconds: 2), () => num1 + num2);

  print(sum);
}

// Write a Dart program that takes in two integers as input, waits for 3 seconds, and then prints the sum of the two numbers.
void calculateInputSum(int num1, int num2) async {
  print('calculating...');
  int total = await Future.delayed(Duration(seconds: 3), () => num1 + num2);

  print(total);
}

// Write a Dart program that takes a list of strings as input, sorts the list asynchronously, and then prints the sorted list.
void sortList(List<String> list) async {
  print('sorting...');
  list.sort();
  print(list);
}

// Write a Dart program that takes a list of integers as input, multiplies each integer by 2 asynchronously, and then prints the modified list.
void multiplyListBy2(List<int> list) async {
  print('multiplying...');
  list = list.map((num1) => num1 * 2).toList();
  print(list);
}

// Write a Dart program that takes a string as input, reverses the string asynchronously, and then prints the reversed string.
void reverseString(String str) async {
  print('reversing...');

  print(str.split('').reversed.join(''));
}
