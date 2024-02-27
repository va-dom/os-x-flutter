import 'package:dart_practice_app/dart_practice_7.dart' as practice_sev_func;

void runPractice() {
  print(" PRACTICE 7 ");

  print(
      "2. Create a late variable named address, assign a US value to it and print it.");
  late String address;
  address = 'NPA Malaya, USA';
  print('Address: $address');

  print(
      "4. Write a program in a dart to create an age variable and assign a null value to it using ?.");
  int? age; // Declare a nullable variable age
  // Assign a null value to the age variable
  age = null;
  // Printing the age
  print('Age: $age');

  print(
      "5. Write a function that accepts a nullable int parameter and returns 0 if the value is null using null coalescing operator ??.");
  int nullCheck(int? num) => num ?? 0;
  int? num1 = 10;
  int? num2;
  print(nullCheck(num1));
  print(nullCheck(num2));

  print(
      "6. Write a function named generateRandom() in dart that randomly returns 100 or null. Also, assign a return value of the function to a variable named status that can’t be null. Give status a default value of 0, if generateRandom() function returns null.");
  int status = practice_sev_func.generateRandom() ?? 0;
  print('Status: $status');
}
