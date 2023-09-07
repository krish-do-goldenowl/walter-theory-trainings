import 'package:unit_test_3/unit_test_3.dart';
import 'package:test/test.dart';

void main() {
  group("test", () {
    test('divisor', () {
      expect(checkPrimes(1), false);
    });
    test('divisor', () {
      expect(checkPrimes(2), true);
    });
    test('divisor', () {
      expect(checkPrimes(3), true);
    });
    test('divisor', () {
      expect(checkPrimes(4), false);
    });
    test('divisor', () {
      expect(checkPrimes(5), true);
    });
    test('divisor', () {
      expect(checkPrimes(6), false);
    });
    test('divisor', () {
      expect(checkPrimes(7), true);
    });
    test('divisor', () {
      expect(checkPrimes(1000), false);
    });
  });
}
