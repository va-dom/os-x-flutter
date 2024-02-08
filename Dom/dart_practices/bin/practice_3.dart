import 'dart:math';

var author = "Dominic Franz Sto.Domingo";
void main(){
  int? randomNum;
  //Write a program in Dart to print your own name using function.
  printAuthorName(author);
  // Write a program in Dart to print even numbers between intervals using function.
  randomNum = 10 + Random().nextInt((100 + 1) - 10);
  printEvenNumbers(randomNum);
  // Create a function called greet that takes a name as an argument and prints a greeting message. For example, greet(“John”) should print “Hello, John”.
  greet("Dom");
  // Write a program in Dart that generates random password.
  // Write a program in Dart that find the area of a circle using function. Formula: pi * r * r
  // Write a program in Dart to reverse a String using function.
  // Write a program in Dart to calculate power of a certain number. For e.g 5^3=125
  // Write a function in Dart named add that takes two numbers as arguments and returns their sum.
  // Write a function in Dart called maxNumber that takes three numbers as arguments and returns the largest number.
  // Write a function in Dart called isEven that takes a number as an argument and returns True if the number is even, and False otherwise.
  // Write a function in Dart called createUser with parameters name, age, and isActive, where isActive has a default value of true.
  // Write a function in Dart called calculateArea that calculates the area of a rectangle. It should take length and width as arguments, with a default value of 1 for both. Formula: length * width.
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