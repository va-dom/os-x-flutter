import 'package:dart_practice/practice3.dart'
    as practice3_lib; //to use the reverseString function

//Function for Question 3
Future<DateTime> printCurrTime() async {
  return Future.delayed(Duration(seconds: 2), () => DateTime.now());
}

//Function for Question 5
Future<String> firstFunction() {
  return Future.delayed(Duration(seconds: 2), () => "1st Function completed");
}

Future<String> secondFunction() {
  return Future.delayed(Duration(seconds: 2), () => "2nd Function completed");
}

void printResult() async {
  print(
      "Question5: Result: ${await firstFunction()} , ${await secondFunction()}");
}

//Function for Question 6
Future<int> add(int num1, int num2) {
  return Future.delayed(Duration(seconds: 3), () => num1 + num2);
}

void getSum6() async {
  int sum = await add(1, 2);
  print("Question6: Sum: $sum");
}

//Function for Question 7
void getSum7(int num1, int num2) async {
  int sum = await add(num1, num2);
  print("Question7: Sum: $sum");
}

//Function for Question 8
Future<List<String>> sortList(List<String> list) async {
  list.sort();
  return await Future.delayed(Duration(seconds: 2), () => list);
}

//Function for Question 9
Future<List<int>> doubleList(List<int> list) async {
  List<int> doubledList =
      list.map((int number) => number * 2).toList(); // using map() function
  return await Future.delayed(Duration(seconds: 2), () => doubledList);
}

//Function for Question 10
Future<String> reverseString(String str) async {
  String reversedStr =
      practice3_lib.reverseString(str); // use function from practice3
  return await Future.delayed(Duration(seconds: 2), () => reversedStr);
}
