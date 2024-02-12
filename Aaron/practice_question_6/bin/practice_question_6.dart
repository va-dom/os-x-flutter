import "dart:io";

import "package:practice_question_6/laptop_class.dart";
import "package:practice_question_6/house_class.dart";
import "package:practice_question_6/gender_enum_class.dart";
import "package:practice_question_6/cat_class.dart";
import "package:practice_question_6/camera_class.dart";
import "package:practice_question_6/bottle_class.dart";
import "package:practice_question_6/question_class.dart";
import "package:practice_question_6/quiz_class.dart";
void main(List<String> arguments) {
  
  print("-------------------Practice Question 6-------------------");
  
  //Question 1
  print("Write a dart program to create a class Laptop with properties [id, name, ram] and create 3 objects of it and print all details.");
  Laptop laptop1 = Laptop();
  laptop1.id = 123;
  laptop1.name = "ASUS";
  laptop1.ram = "16GB";
  laptop1.printDetails();

  Laptop laptop2 = Laptop();
  laptop2.id = 456;
  laptop2.name = "Lenovo";
  laptop2.ram = "8GB";
  laptop2.printDetails();

  Laptop laptop3 = Laptop();
  laptop3.id = 789;
  laptop3.name = "ACER";
  laptop3.ram = "4GB";
  laptop3.printDetails();


  //Question 2
  print("2. Write a dart program to create a class House with properties [id, name, prize]. Create a constructor of it and create 3 objects of it. Add them to the list and print all details.");
  List<House> houses = [];

  houses.add(House(123, "House 1", 150000));
  houses.add(House(456, "House 2", 200000));
  houses.add(House(789, "House 3", 5000000));

  for(House house in houses){
    house.printDetails();
  }

  //Question 3
  print("3. Write a dart program to create an enum class for gender [male, female, others] and print all values.");
  for(Gender gender in Gender.values){
    print(gender.name);
  }

  //Question 4
  print("4. Write a dart program to create a class Animal with properties [id, name, color]. Create another class called Cat and extends it from Animal. Add new properties sound in String. Create an object of a Cat and print all details.");
  Cat cat = Cat();
  cat.id = 123;
  cat.name = "Garfield";
  cat.color = "Orange";
  cat.sound = "Meow!";

  cat.printDetails();

  //Question 5
  print("5. Write a dart program to create a class Camera with private properties [id, brand, color, prize]. Create a getter and setter to get and set values. Also, create 3 objects of it and print all details.");
  Camera cam1 = Camera();
  cam1.id = 123;
  cam1.brand = "Canon";
  cam1.color = "Black";
  cam1.prize = 50000;
  cam1.printDetails();

  Camera cam2 = Camera();
  cam2.id = 456;
  cam2.brand = "Nikon";
  cam2.color = "Black";
  cam2.prize = 45000;
  cam2.printDetails();

  Camera cam3 = Camera();
  cam3.id = 789;
  cam3.brand = "Canon";
  cam3.color = "Silver";
  cam3.prize = 50000;
  cam3.printDetails();

  //Question 6
  print("6. Create an interface called Bottle and add a method to it called open(). Create a class called CokeBottle and implement the Bottle and print the message “Coke bottle is opened”. Add a factory constructor to Bottle and return the object of CokeBottle. Instantiate CokeBottle using the factory constructor and call the open() on the object.");
  Bottle bottle = createBottle();
  bottle.open();

  //Question 7
  print("7. Create a simple quiz application using oop that allows users to play and view their score.");
  List<Question> questions = [
    Question("Which of the following languages has the longest alphabet?", ["Greek", "Russia", "Arabic"], 1),
    Question("The fear of insects is known as what?", ["Entomophobia", "Arachnophobia", "Ailurophobia"], 0),
    Question("Which horoscope sign is a fish?", ["Aquarius", "Cancer", "Pisces"], 2),
    Question("What is the largest US state (by landmass)?", ["Texas", "Alaska", "California"], 1),
    Question("How long did dinosaurs live on the earth?", ["100-150 million years", "150-200 million years", "200+ million years"], 1)
  ];

  Quiz quiz = Quiz(questions);

  while(!quiz.isFinished()){
    Question question = quiz.getCurrentQuestion();
    print("Question ${question.text}");
    for(int i = 0; i < question.options.length; i++){
      print("${i+1}. ${question.options[i]}");
    }

    int chosenIndex;
    do{
      print("Enter your answer (1-${question.options.length}):");
      chosenIndex = int.parse(stdin.readLineSync()!);
    }while(chosenIndex < 1 || chosenIndex > question.options.length);

    bool isCorrect = quiz.answerQuestion(chosenIndex - 1);
    print("Your answer is ${isCorrect ? "correct" : "incorrect"}");
    print("Current score: ${quiz.getScore}\n");
  }

  quiz.showResult();
}
