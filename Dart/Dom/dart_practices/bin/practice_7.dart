// ignore_for_file: dead_code

import 'dart:math';

void main() {
  // Purpose of the ? operator in Dart null safety
  String? name;
  int? nullableAge;
  late String address;

  address = "US";

  print(name?.length);

  print(address);

  int returnZeroIfNull(int? value) {
    return value ?? 0;
  }

  int? age = returnZeroIfNull(nullableAge);
  print("Age: $age");

  int? generateRandom() {
    Random random = Random();
    return random.nextBool() ? 100 : null;
  }

  int status = generateRandom() ?? 0;
  print("Status: $status");
}
