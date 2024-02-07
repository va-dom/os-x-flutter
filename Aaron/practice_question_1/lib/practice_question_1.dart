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
