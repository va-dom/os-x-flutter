import 'dart:math';

int calculate() {
  return 6 * 7;
}

int getNumber(int? number) {
  return number ?? 0;
}

int? generateRandom() {
  return Random().nextBool() ? 100 : null;
}