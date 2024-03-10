import 'dart:math';

class QuestionOne {
  void runOne() {
    int x = Random().nextInt(100);
    print("Write a dart program to check if the number is odd or even.");
    print(x % 2 == 0 ? "$x is Even" : "$x is odd");
  }

  void runTwo() {
    int x = Random().nextInt(26) + 97;
    const vowels = ['a', 'e', 'i', 'o', 'u'];
    var char = String.fromCharCode(x);
    print(
        "Write a dart program to check whether a character is a vowel or consonant.");

    if (vowels.contains(char.toLowerCase())) {
      print("$char is a vowel.");
    } else {
      print("$char is a consonant");
    }
  }

  void runThree() {
    int x = Random().nextInt(100);
    bool y = Random().nextBool();
    int z = -x;
    print(
        "Write a dart program to check whether a number is positive, negative, or zero.");
    if (x == 0) {
      print("$x is 0");
    } else if (y) {
      print("$x is positive");
    } else {
      x = z;
      print("$x is Negative");
    }
  }

  void runFour() {
    print("Write a dart program to print your name 100 times.");
  }

  void runFive() {
    print("Write a program to print a square of a number using user input.");
  }

  void runSix() {
    print(
        "Write a program to print full name of a from first name and last name using user input.");
  }

  void runSeven() {
    print("Write a program to find quotient and remainder of two integers.");
  }

  void runEight() {
    print("Write a program to swap two numbers.");
  }

  void runNine() {
    print("Write a program in Dart to remove all whitespaces from String.");
  }

  void runTen() {
    print("Write a Dart program to convert String to int.");
  }

  void runEleven() {
    print(
        "Write a program to calculate split amount of bill. Formula= (total bill amount) / number of people");
  }

  void runTwelve() {
    print(
        "Write a program to calculate time taken to reach office in minutes. Formula= (distance) / (speed)");
  }
}
