import 'package:practice_app/practice_7.dart' as practice_seven_utils;

void runPractice(){
  print("**************** EXERCISE 7 ****************\n");

  print("1. What is the purpose of the ? operator in Dart null safety?");
  print("Checks if something is not null before trying to use it. e.g: \n");
  print("""
  String? nullableString = "Hello";
  int? length = nullableString?.length;
  print(length); // Output: 5
""");

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("2. Create a late variable named address, assign a US value to it and print it.");
  late String address;
  address = '123 Main St, New York, NY';
  print(address);


  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("3. How do you declare a nullable type in Dart null safety?");
  print("""
  String? nullableString = "Hello";
  int? length = nullableString?.length;
  print(length); // Output: 5
""");

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("4. Write a program in a dart to create an age variable and assign a null value to it using ?.");
  int? age;
  age = null;
  print(age); // Output: null

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("5. Write a function that accepts a nullable int parameter and returns 0 if the value is null using null coalescing operator ??.");
  int? nullableValue1 = 10;
  int? nullableValue2;

  print(practice_seven_utils.returnNonNull(nullableValue1)); // Output: 10
  print(practice_seven_utils.returnNonNull(nullableValue2)); // Output: 0

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("6. Write a function named generateRandom() in dart that randomly returns 100 or null. Also, assign a return value of the function to a variable named status that can’t be null. Give status a default value of 0, if generateRandom() function returns null.");
  int status = practice_seven_utils.generateRandom() ?? 0;
  print("Status: $status");

  print("\n********************************************** END OF EXERCISE 7 **********************************************\n");
}