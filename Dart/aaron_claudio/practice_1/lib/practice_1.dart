//Question 1
String myName(){
  return "Aaron Claudio";
}

//Question 2
String hello1(){
  return 'Hello I am ${myName()}';
}

String hello2(){
  return "Hello I'm ${myName()}";
}

//Question 3
int constNum(){
  const num = 7;
  return num;
}

//Question 4
double getInterest(){
  int p = 150;
  int t = 75;
  int r = 23;
  double interest = (p * t * r) / 100;
  return interest;
}

//Question 5
int getSquareRoot(int num) {
  return num * num;
}

//Question 6
String getFullName(String fname, String lname){
  return "$fname $lname";
}

//Question 7
int getRemainder(int num1, int num2){
  return num1 % num2;
}

int getQuotient(int num1, int num2){
  return num1 ~/ num2;
}

//Question8


//Question 9
String reverseText(String? str1){
  return str1.toString().replaceAll(' ', '');
}


//Question 11
double splitBill(double amount, int pax){
  return (amount) / pax;
}

//Question 12
double calculateTime(int distance, int speed){
  double hours = (distance) / speed;
  return hours * 60;
}