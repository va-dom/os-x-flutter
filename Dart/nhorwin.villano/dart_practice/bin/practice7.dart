import 'package:dart_practice/practice7.dart' as practice7;

void runPractice() {
  print("---------------------------------------------------");
  print("Questions for Practice 7");
  print("---------------------------------------------------");

  print("1. What is the purpose of the ? operator in Dart null safety?");
  print("The operator '?' is used to declare a nullable variable");
  print("\n");

  print(
      "2. Create a late variable named address, assign a US value to it and print it.");
  practice7.Address obj = practice7.Address();
  //obj.printAddress(); <--- this will cause LateInitializationError
  obj.address = "US"; // late variable is initialized here
  obj.printAddress();
  print("\n");

  print("3. How do you declare a nullable type in Dart null safety?");
  print("The operator '?' is used to declare a nullable type");
  print("\n");

  print(
      "4. Write a program in a dart to create an age variable and assign a null value to it using ?.");
  int? age;
// Assigning age to 27
  age = 27;
// Assigning null to age
  age = null;
  print("Age : $age");
  print("\n");

  print(
      "5. Write a function that accepts a nullable int parameter and returns 0 if the value is null using null coalescing operator ??.");
  practice7.printNumOrZero(3);
  practice7.printNumOrZero(null);
  print("\n");

  print(
      "6. Write a function named generateRandom() in dart that randomly returns 100 or null. Also, assign a return value of the function to a variable named status that can't be null. Give status a default value of 0, if generateRandom() function returns null.");
  int? status = practice7.generateRandom() ?? 0;
  print(status);
  print("\n");
}
