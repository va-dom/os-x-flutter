import 'dart:math';

class QuestionOne {
  void runOne() {
    print("1. Write a program to print your name in Dart.");
    print("Hi! My name is Dom");
  }

  void runTwo() {
    print(
        "2. Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.");
    print(r"Hello I am “John Doe”");
    print(r"Hello I’am “John Doe”");
  }

  void runThree() {
    const int x = 7;
    print("3. Declare constant type of int set value 7.");
    print("x have a constant value of: $x");
  }

  void runFour() {
    print(
        "4. Write a program in Dart that finds simple interest. Formula= (p * t * r) / 100");
    double p = Random().nextDouble() * 100;
    double t = Random().nextDouble() * 100;
    double r = Random().nextDouble() * 100;
    double result = p * t * r;
    print("$p * $t * $r =  $result");
  }

  void runFive() {
    int y = Random().nextInt(100);
    print("5. Write a program to print a square of a number using user input.");
    print("entered number is $y with square root of ${y * y}\n");
  }

  void runSix() {
    String fn = "John";
    String ln = "Doe";
    print(
        "6. Write a program to print full name of a from first name and last name using user input.");
    print("full name is: $fn $ln\n");
  }

  void runSeven() {
    double q1 = Random().nextDouble() * 100;
    double q2 = Random().nextDouble() * 100;
    print("7. Write a program to find quotient and remainder of two integers.");
    print("the quotient is: ${q1 / q2}");
    print("with remainder of ${q1 % q2}");
  }

  void runEight() {
    int num1 = Random().nextInt(100);
    int num2 = Random().nextInt(100);
    int temp = Random().nextInt(100);
    print("8. Write a program to swap two numbers.");
    print("\nfrom first number $num1 and second number $num2");
    temp = num1;
    num1 = num2;
    num2 = temp;
    print("to first number $num1 and second number $num2");
  }

  void runNine() {
    print("9. Write a program in Dart to remove all whitespaces from String.");
    String word = "HA HA HA HA HA HA";
    String newWord;
    print('Original string: $word');
    newWord = word.replaceAll(RegExp(r'\s+'), '');
    print('String after removing white spaces: $newWord');
  }

  void runTen() {
    int x = Random().nextInt(100);
    String word;
    int num;
    word = x.toString();
    print("10. Write a Dart program to convert String to int.");
    print("$word is ${word.runtimeType}");
    num = int.parse(word);
    print("$word now is ${num.runtimeType}");
  }

  void runEleven() {
    double total = Random().nextDouble() * 100;
    int pax = Random().nextInt(100);
    double splitBill = total / pax.toDouble();
    print(
        "11. Write a program to calculate split amount of bill. Formula= (total bill amount) / number of people");

    print("Bill of $total will be split by ${pax.toInt()}");
    print("result is $splitBill");
  }

  void runTwelve() {
    double distance = Random().nextDouble() * 100;
    int speed = Random().nextInt(100);
    print(
        "12. Write a program to calculate time taken to reach office in minutes. Formula= (distance) / (speed)");
    double time = distance / speed.toDouble();
    print("you'll be in the office in $time hour(s)");
  }
}
