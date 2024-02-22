void main() {
  print("---------------------------------------------------");
  print("Questions for Practice 7");
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
  // List<int> items = [1, 2, null, 4];   //error
  String? name;
  name = null;
  // String name1 = name; //error
  String name1 = name!; //this will throw an exeption error
  print(name1);
  print("\n");
}
