import 'dart:math';
void main(){
  
  //Write a dart program to check if the number is odd or even.
  checkIfEven(Random().nextInt(100));
  // Write a dart program to check whether a character is a vowel or consonant.
  checkIfVowel(Random().nextInt(26)+97);
  // Write a dart program to check whether a number is positive, negative, or zero.
  checkIfPositive(Random().nextInt(100), Random().nextBool());
  // Write a dart program to print your name 100 times.
  printName100();
  // Write a dart program to calculate the sum of natural numbers.
  getSum(Random().nextInt(100), Random().nextInt(100));
  // Write a dart program to generate multiplication tables of 5.
  multiplyByFive();
  // Write a dart program to generate multiplication tables of 1-9.
  printMultiplicationTable();
  // Write a dart program to create a simple calculator that performs addition, subtraction, multiplication, and division.
  useCalculator(Random().nextInt(100), Random().nextInt(100), Random().nextInt(4));
  // Write a dart program to print 1 to 100 but not 41.
  printToHundredNo41();
}


void checkIfEven(int x){
  print(x % 2 == 0 ? "$x is Even" : "$x is odd");
}

void checkIfVowel(int x){
  const vowels = ['a', 'e', 'i', 'o', 'u'];
  var char = String.fromCharCode(x);
  if(vowels.contains(char.toLowerCase())){
    print("$char is a vowel.");
  }
  else{
    print("$char is a consonant");
  }
}

void checkIfPositive(num x, bool y){
  if(x == 0){
    print("$x is 0");
  }
  else if(y){
    print("$x is positive");
  }
  else{
    x = convertToNegative(x);
    print("$x is positive");
  }
}

void printName100(){
  for(int x = 0; x < 100; x++){
    print("${x + 1}. Dom");
  }
}

void getSum(int x, int y){
  if(x == 0 || y == 0){
    print("0 is not a natural number");
  }
  else if(x.isNegative || y.isNegative){
    print("Negative numbers are NOT natural numbers");
  }
  else{
    print("sum of $x and $y is: ${x + y}");
  }
}

num convertToNegative(num x){
  x = -x;
  return x;
}

void multiplyByFive(){
  for(int x = 0; x < 10; x++){
    print("${x+1} * 5 = ${x+1 * 5}");
  }
  
}

void printMultiplicationTable(){
  for(int x = 0; x < 10; x++){
    for(int y = 0; y < 10; y++){
      print("${y + 1} * ${x + 1}\t=\t${(x + 1) * (y + 1)}");
    }
    print("");
  }
}

void useCalculator(num x, num y, int z){
  switch(z) {
    case 0:
        print("$x * $y = ${x * y}");
        break;
    case 1:
        print("$x / $y = ${x / y}");
        break;
    case 2:
        print("$x + $y = ${x + y}");
        break;
    case 3:
        print("$x - $y = ${x - y}");
        break;
    default:
       print("invalid operation.");
  }
}

void printToHundredNo41(){
  for(int x = 1; x <= 100; x++){
    if(x != 41){
      print(x);
    }
    else{
      continue;
    }
  }
}