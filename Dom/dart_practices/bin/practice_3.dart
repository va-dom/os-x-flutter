import 'dart:math';

var author = "Dominic Franz Sto.Domingo";
const double = 3.14;

void main(){
  int num1 = Random().nextInt(100)+1;
  int num2 = Random().nextInt(100)+1;
  int num3 = Random().nextInt(100)+1;
  int? randomNum;
  const int passLen = 12;
  
  //Write a program in Dart to print your own name using function.
  printAuthorName(author);
  // Write a program in Dart to print even numbers between intervals using function.
  randomNum = 10 + Random().nextInt((100 + 1) - 10);
  printEvenNumbers(randomNum);
  // Create a function called greet that takes a name as an argument and prints a greeting message. For example, greet(“John”) should print “Hello, John”.
  greet("Dom");
  // Write a program in Dart that generates random password.
  print("new random password: ${generatePassword(passLen)}");
  // Write a program in Dart that find the area of a circle using function. Formula: pi * r * r
  getAreaOfCircle(Random().nextDouble() * 100 , Random().nextDouble() * 100);
  // Write a program in Dart to reverse a String using function.
  getReversedString("Hello World");
  // Write a program in Dart to calculate power of a certain number. For e.g 5^3=125
  getExponent(Random().nextInt(10)+1, Random().nextInt(10)+1);
  // Write a function in Dart named add that takes two numbers as arguments and returns their sum.
  print("$num1 + $num2 = ${add(num1, num2)}");
  // Write a function in Dart called maxNumber that takes three numbers as arguments and returns the largest number.
  print("numbers: $num1, $num2, $num3");
  print("Largest number is: ${maxNumber(num1, num2, num3)}");
  // Write a function in Dart called isEven that takes a number as an argument and returns True if the number is even, and False otherwise.
  print("Is $num1 even? ${checkIfEven(num1)}");
  // Write a function in Dart called createUser with parameters name, age, and isActive, where isActive has a default value of true.
  Map<String, dynamic> user1 = createUser("John", Random().nextInt(65)+15);
  print("User 1: ${user1['name']}, ${user1['age']}, ${user1['isActive']}");
  Map<String, dynamic> user2 = createUser("Doe", Random().nextInt(65)+15, isActive: Random().nextBool());
  print("User 2: ${user2['name']}, ${user2['age']}, ${user2['isActive']}");
  // Write a function in Dart called calculateArea that calculates the area of a rectangle. It should take length and width as arguments, with a default value of 1 for both. Formula: length * width.
  circulateArea();
  circulateArea(len:10, wid:10);
}

int generateNum(){
    return Random().nextInt(100);
}

void printAuthorName(String name){
  print(name);
}

void printEvenNumbers(int max){
  print("max is $max");
  for(int x = 0; x < max; x++){
    if(x % 2 == 0){
      print(x);
    }
    else{
      continue;
    }
  }
}

void greet(String name){
  print("Hello $name");
}

String? generatePassword(int length){
  String newPass = "";
  const String lowerAlph = 'abcdefghijklmnopqrstuvwxyz';
  const String upperAlph = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String nums = '0123456789';
  const String specialChar = '!@#\$%^&*()-_=+[]{}|;:,.<>?';  
  String password = lowerAlph + upperAlph + nums + specialChar;
  for(int x = 0; x < length; x++){
    int index = Random().nextInt(password.length);
    newPass += password[index];
  }

  return newPass;
}

void getAreaOfCircle(num r1, num r2){
  num result;
  result = pi * r1 * r2;
  print("for ${pi.toStringAsFixed(2)}, ${r1.toStringAsFixed(2)}, and ${r2.toStringAsFixed(2)}|. area is: ${result.toStringAsFixed(2)}");
}

void getReversedString(String word){
  String revWord = "";
  for(int x = word.length - 1; x >= 0; x--){
    revWord += word[x];
  }
  print("input: $word");
  print("reversed: $revWord");
}

void getExponent(int input, int exponent){
  print("$input to the power of $exponent is ${pow(input, exponent)}");
}

num add(num num1, num num2){
  return num1 + num2;
}

int maxNumber(int x, int y, int z){
  int max = 0;
  if (x > y && x > z) {
    max = x;
  }
  else if (y > x && y > z){
    max = y;
  }
  else{
    max = z;
  }

  return max;
}

bool checkIfEven(int x){
  return x % 2 == 0; 

}

Map<String, dynamic> createUser(String name, int age, {bool isActive = true}) {
    return {
      'name': name,
      'age': age,
      'isActive': isActive,
    };
  }

void circulateArea({int len = 1, int wid = 1}){
print("Area of $len and $len is ${len * wid}");
}