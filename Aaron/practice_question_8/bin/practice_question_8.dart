import "package:intl/intl.dart";
import "dart:io";

void main(List<String> arguments) async{

  print("-------------------Practice Question 8-------------------");

  //Question 3
  print("3. Write a program to print current time after 2 seconds using Future.delayed()");
  Future<String> getCurrentTime() async {
    DateFormat dtf = DateFormat("h:mm a");
    return Future.delayed(Duration(seconds: 2), () => dtf.format(DateTime.now()));
  }
  print("Current time will be printed after 2 seconds:");
  getCurrentTime().then((value) => print(value));

  //Question 4
  print("4. Write a program in dart that reads csv file and print it’s content.");
  File file = File("C:\\Users\\Aaron Claudio\\Downloads\\Dart Exercises\\students.csv");
  final contents = await file.readAsLines();

  for(final content in contents){
    final values = content.split(",");
    print(values);
  }

  //Question 5
  print("5. Write a program in dart that uses Future class to perform multiple asynchronous operations, wait for all of them to complete, and then print the results.");
  Future<String> operation1(){
    return Future.delayed(Duration(seconds: 2), () => "Result from operation1");
  }
  Future<String> operation2(){
    return Future.delayed(Duration(seconds: 2), () => "Result from operation2");
  }

  final results = await Future.wait([operation1(), operation2()]);
  print(results[0]);
  print(results[1]);

  //Question 6
  print("6. Write a Dart program to calculate the sum of two numbers using async/await.");
  Future<int> addNumbers(int num1, int num2) async{
    await Future.delayed(Duration(seconds: 3));
    return num1 + num2;
  }

  int sum = await addNumbers(15, 47);
  print("Total: $sum");

  //Question 7
  print("7. Write a Dart program that takes in two integers as input, waits for 3 seconds, and then prints the sum of the two numbers.");
  stdout.writeln("Enter first number: ");
  int? num1 = int.parse(stdin.readLineSync()!);
  stdout.writeln("Enter second number: ");
  int? num2 = int.parse(stdin.readLineSync()!);

  int sum1 = await addNumbers(num1, num2);
  print("Total: $sum1");

  //Question 8
  print("8. Write a Dart program that takes a list of strings as input, sorts the list asynchronously, and then prints the sorted list.");
  Future<List<String>> sortAsync(List<String> lists) async{
    return Future.microtask(() => lists..sort());
  }
  final unsortedLists = ["lorem", "ipsum", "dolor", "sit", "amet"];
  final sortedLists = await sortAsync(unsortedLists);

  print(sortedLists);

  //Question 9
  print("9. Write a Dart program that takes a list of integers as input, multiplies each integer by 2 asynchronously, and then prints the modified list.");
  Future<List<int>> multiplyByTwoAsync(List<int> numbers) async{
    final product = await Future.wait(numbers.map((e) => Future.microtask(() => e * 2)).toList());

    return product;
  }
  final numbers = [1, 2, 3, 4, 5, 6];
  final products = await multiplyByTwoAsync(numbers);

  print(products);

  //Question 10
  print("10. Write a Dart program that takes a string as input, reverses the string asynchronously, and then prints the reversed string.");
  Future<String> reverseStringAsync(String text) async{
    return Future.microtask(() => text.split('').reversed.join());
  }
  String text = "Lorem ipsum dolor";
  String reversedString = await reverseStringAsync(text);

  print(reversedString);

  
}
