import 'package:test/test.dart';
import 'package:unit_test_1/unit_test_1.dart';

void main() {
  group("test", () {
    test('divisor', () {
      expect(getListDivisor(4), [1, 2, 4]);
    });
    test('divisor', () {
      expect(getListDivisor(8), [1, 2, 4, 8]);
    });
  });
}
