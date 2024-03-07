import 'dart:math';

int returnNonNull(int? value) {
  return value ?? 0;
}

int? generateRandom() {
  // Generate a random number between 0 and 1
  int randomNumber = Random().nextInt(2);
  
  // If randomNumber is 0, return 100. Otherwise, return null.
  return randomNumber == 0 ? 100 : null;
}