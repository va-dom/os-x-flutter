import 'package:practice4/practice4.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('calculateTotalFromList', () => expect(calculateTotalFromList([1, 10, 57]), 68));
}
