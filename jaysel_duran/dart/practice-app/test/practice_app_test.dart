import 'package:test/test.dart';
import '../lib/practice_app.dart' as mainFunctions;

void main() {
  test('calculate', () {
    expect(mainFunctions.getMenu(), isNotNull);
  });
}
