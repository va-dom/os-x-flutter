//Question 1
String isOddOrEven(int num) {
  return (num % 2 == 0) ? "The number is even." : "The number is odd.";
}

//Question 2
String isVowelOrConsonant(String letter){
  //other option for checking
  var lttr = letter.toLowerCase();
  return (lttr == 'a' ||
          lttr == 'e' ||
          lttr == 'i' ||
          lttr == 'o' ||
          lttr == 'u') ? "$lttr is a vowel" : "$lttr is a consonant";
}

//Question 3
String isPositiveOrNegative(int num) {
  if(num == 0){
    return "The number is zero.";
  }
  else if(num < 0){
    return "The number is negative.";
  }
  else{
    return "The number is positive.";
  }
  
}

//Question 5
int sumOfNaturalNumbers(int num){
  int sum = 0;

  for(int i = 1; i <= num; i++){
    sum += i;
  }
  return sum;
}


//Question 8
int add(int num1, int num2){
  return num1 + num2;
}

int subtract(int num1, int num2){
  return num1 - num2;
}

int multiply(int num1, int num2){
  return num1 * num2;
}

double divide(int num1, int num2){
  return num1 / num2;
}