import 'dart:math';

int? generateRandom() {
  Random random = Random();
  // Generate a random number between 0 and 1
  int randomNumber = random.nextInt(2);
  // Return 100 if random number is 0, otherwise return null
  return randomNumber == 0 ? 100 : null;
}
