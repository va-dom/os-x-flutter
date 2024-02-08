import 'dart:math' as math;

//Question 1
String myName(){
  return "Aaron Claudio";
}

//Question 2
List<int> getEvenNumbers(int num1, int num2){
  List<int> evens = [];
  for(int i = num1; i <= num2; i++){
    if(i % 2 == 0){
      evens.add(i);
    }
  }
  return evens;
}

//Question 3
String greet(String name){
  return "Hello, $name";
}

//Question 4
String generatePassword(){
  List<String> allalphabets = 'abcdefghijklmnopqrstuvwxyz'.split('');
  List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  List<String> specialCharacters = ["@", "#", "%", "&", "*"];
  List<String> password = [];
  for (int i = 0; i < 5; i++) {
    password.add(allalphabets[math.Random().nextInt(allalphabets.length)]);
    password.add(numbers[math.Random().nextInt(numbers.length)].toString());
    password.add(specialCharacters[math.Random().nextInt(specialCharacters.length)]);
  }
  return password.join();
}

//Question 5
double getArea(double r){
  return (math.pi * r * r);
}

//Question 6
String reverseString(String txt){
  return (txt.split('').reversed.join());
}

//Question 7
num calculatePow(num num1, num expnt){
  return math.pow(num1, expnt);
}

//Question 8
int add(int num1, int num2){
  return num1 + num2;
}

//Question 9
int maxNumber(int a, int b, int c){
  if(a >= b && a >= c){
    return a;
  }
  else if(b >= a && b >= c){
    return b;
  }
  else{
    return c;
  }
}

//Question 10
bool isEven(int num9){
  return (num9 % 2 == 0);
}

//Question 11
Map<String, dynamic> createUser(String name, int age, {bool isActive = true}){
  return {
    'name' : name,
    'age' : age,
    'isActive' : isActive
  };
}

//Question 12
double calculateArea([double length = 1, double width = 1]){
  return length * width;
}