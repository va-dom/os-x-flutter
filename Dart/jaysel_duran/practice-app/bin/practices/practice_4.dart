import 'package:practice_app/practice_4.dart' as practice_four_utils;

void runPractice(){
  print("**************** EXERCISE 4 ****************\n");

  print("Create a list of names and print all names using list.");
  practice_four_utils.getPrintNamesExcercise();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Create a set of fruits and print all fruits using loop.");
  practice_four_utils.getPrintFruitsExcercise();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Create a program thats reads list of expenses amount using user input and print total.");
  practice_four_utils.getExpenseTotalCalculatorExercise();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Create an empty list of type string called days. Use the add method to add names of 7 days and print all days.");
  practice_four_utils.getDaysExercise();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Add your 7 friend names to the list. Use where to find a name that starts with alphabet a.");
  print(practice_four_utils.getNameFinderExcercise("David") ? "Name \"David\" is found." : "Name not found");

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Create a map with name, address, age, country keys and store values to it. Update country name to other country and print all keys and values.");
  practice_four_utils.getPlaceExercise();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Create a map with name, phone keys and store some values to it. Use where to find all keys that have length 4.");
  practice_four_utils.getMapExercise();

  print("\n---------------------------------------------------------------------------------------------------------------\n");

  print("Create a simple to-do application that allows user to add, remove, and view their task.");
  practice_four_utils.getTodoExercise();

}