import "package:practice_question_6/laptop_class.dart";

void main(List<String> arguments) {
  
  print("-------------------Practice Question 6-------------------");
  
  //Question 1
  print("Write a dart program to create a class Laptop with properties [id, name, ram] and create 3 objects of it and print all details.");
  Laptop laptop = Laptop();
  laptop.id = 123;
  laptop.name = "Lenovo";
  laptop.ram = "16GB";
  print(laptop.id);
  print(laptop.name);
  print(laptop.ram);

}
