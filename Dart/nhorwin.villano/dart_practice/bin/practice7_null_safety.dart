import 'package:dart_practice/practice7_null_safety.dart'
    as practice7_null_safety;

void runPractice() {
  print("---------------------------------------------------");
  print("Questions for Practice 7 Null Safety Exercise");
  print("---------------------------------------------------");

  print("Exercise 1: Null Safety In Dart");
  // Try to assign a null value to age variable using ?
  // int age;   //error
  int? age;
  age = null;
  print("Age is $age");
  print("\n");

  print("Exercise 2: Nullable Type Parameter For Generics");
  // Try to make the type parameter of List nullable
  // List<int> items = [1, 2, null, 4];   //error
  List<int?> items = [1, 2, null, 4];
  print(items);
  print("\n");

  print("Exercise 3: Null Assertion Operator (!)");
  // Try using null assertion operator ! to print null if the variable is null.
  String? name;
  name = null;
  // String name1 = name; //error
  //String name1 = name!; //this will throw an exeption error
  String name1 = name ?? "null";
  print(name1);
  print("\n");

  print("Exercise 4: Null Assertion Operator (!) For Generics");
  // Try using null assertion operator ! to print null if the variable is null.
  List<int?> items2 = [1, 2, null, 4];
  int firstItem = items2.first!;
  print(firstItem);
  print("\n");

  print("Exercise 5: Null Assertion Operator (!) For Generics");
  // Try using null assertion operator ! to print null if the variable is null.
  int? returnNullButSometimesNot() {
    return -5;
  }

  int result = returnNullButSometimesNot()!.abs();
  print(result);
  print("\n");

  print("**Exercise 6: Null Assertion Operator (!)**");
  // Try to use null assertion operator(!) to print the length of the String or return null if the variable is null
  int findLength(String? name) {
    // add null assertion operator here
    return name!.length;
  }

  int? length = findLength("Hello");
  print("The length of the string is $length");
  print("\n");

  print("Exercise 7: Null Coalescing Operator (??)");
  // Try to use null coalescing operator(??) to assign a default value to Stranger if it is null
  String? name2;
  name = null;
  String name3 = name2 ?? 'Stranger';
  print(name3);
  print("\n");

  print("Exercise 8: Type Promotion");
  // Try to solve the error using type promotion
  Object name4 = "Mark";
  if (name4 is String) {
    print("The length of name is ${name4.length}");
  }
  print("\n");

  print("Exercise 9: Type Promotion");
  // Try to solve the error using type promotion
  practice7_null_safety.DataProvider().myMethod();
  print("\n");

  print("Exercise 10: Late Keyword");
  // Try to solve the error using late keyword
  practice7_null_safety.Person person = practice7_null_safety.Person();
  person.setName("Mark");
  print(person.name);
  print("\n");
}
