import 'package:test/test.dart';
import 'package:practice_app/practice_app.dart' as mainFunctions;

void main() {
  test('calculate', () {
    expect(mainFunctions.getMenu(), isNotNull);
  });
}
