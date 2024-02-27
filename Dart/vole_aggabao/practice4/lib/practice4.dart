int calculate() {
  return 6 * 7;
}

num calculateTotalFromList(List<num> numList) {
  return numList.fold(0, (num a, num b) => a + b);
}