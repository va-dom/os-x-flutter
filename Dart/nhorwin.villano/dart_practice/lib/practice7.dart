import 'dart:math';

class Address {
  // late variable
  late String address;

  void printAddress() {
    print("Address: $address");
  }
}

void printNumOrZero(int? num) {
  print("Number: ${num ?? 0}");
}

int? generateRandom() {
  return Random().nextBool() ? 100 : null;
}
