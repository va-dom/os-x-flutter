import 'dart:math';

double calcDistanceAndSpeed(distance, speed) {
  return (distance * 1000) / (speed * 60);
}

double calcSimpleInterest([double p = 1, double t = 1, double r = 1]) {
  double interest = (p * t * r) / 100;

  return interest;
}

int getSquare(int number) {
  return number * number;
}

int getQuotient(int dividend, int divisor) {
  return dividend ~/ divisor;
}

int getRemainder(int dividend, int divisor) {
  return dividend % divisor;
}

double getAreaOfCircle(double radius) {
  return pi * radius * radius;
}

double getArea(length, width) {
  return length * width;
}
