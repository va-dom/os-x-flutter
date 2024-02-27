import 'dart:io';

// Function to read expenses from user input and calculate total
double calculateTotalExpenses(List<double> expenses) {
  double total = 0;
  for (double expense in expenses) {
    total += expense;
  }
  return total;
}

// Function to read list of expenses from user input
List<double> readExpenses() {
  List<double> expenses = [];
  stdout.write("Enter the number of expenses: ");
  int numOfExpenses = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < numOfExpenses; i++) {
    stdout.write("Enter expense ${i + 1}: ");
    double expense = double.parse(stdin.readLineSync()!);
    expenses.add(expense);
  }
  return expenses;
}
