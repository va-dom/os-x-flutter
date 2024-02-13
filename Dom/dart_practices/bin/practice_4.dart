import "dart:io";
import "dart:math";

void main(){
// Create a list of names and print all names using list.
List<String> names = ['john', 'doe', 'dom'];
print(names);
// Create a set of fruits and print all fruits using loop.
List<String> fruits = ['mango', 'avocado', 'apple'];
loopPrintList(fruits);
// Create a program thats reads list of expenses amount using user input and print total.
List<double> expenses = [];
// int numOfExpense = Random().nextInt(6)+2;
// for(int x = 0; x < numOfExpense; x++){
//   stdout.write("enter expense ${x + 1}: ");
//   double expense = double.parse(stdin.readLineSync()!);
//   expenses.add(expense);
// }
calculateList(expenses);
// Create an empty list of type string called days. Use the add method to add names of 7 days and print all days.
List<String> day = [];
day.addAll(['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']);
printList(day);
// Add your 7 friend names to the list. Use where to find a name that starts with alphabet a.
List<String> friends = ['Atlantic', 'Alethea', 'Gab', 'Jae', 'Saiba', 'Toji', 'Andrew'];
List<String> startsWithA = friends.where((element) => ((element.toUpperCase()).startsWith('A'))).toList();
printList(startsWithA);
// Create a map with name, address, age, country keys and store values to it. Update country name to other country and print all keys and values.
Map<String, dynamic> person = {
  'name' : 'John Doe',
  'address' : 'Cainta',
  'age' : '25',
  'country' : 'USA'
};
print("from: $person");
person['country'] = "Philippines";
print("to: $person");
// Create a map with name, phone keys and store some values to it. Use where to find all keys that have length 4.
Map<String, String> contacts = {
  'John' : '4503',
  'Does' : '123524',
  'Johns' : '3530'
};

List<String> contactsWith4Length = contacts.keys.where((element) => element.length == 4).toList();
print("Keys with length of 4: $contactsWith4Length");
// Create a simple to-do application that allows user to add, remove, and view their task 

}

void printList(List<dynamic> list){
  print(list);
}

void loopPrintList(List<dynamic> list){
  for(int x = 0; x < list.length; x++){
    print(list[x]);
  }
}

void calculateList(List<num> list){
  num result = 0;
  for ( var x = 0; x < list.length; x++){
    result = result + list[x];
  }
  print("total expense: $result");
}

