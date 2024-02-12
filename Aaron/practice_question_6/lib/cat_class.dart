import "package:practice_question_6/animal_class.dart";

class Cat extends Animal{

  String? sound;

  void printDetails(){
    print("Id: $id");
    print("Name: $name");
    print("Color: $color");
    print("Sound: $sound");
  }

}