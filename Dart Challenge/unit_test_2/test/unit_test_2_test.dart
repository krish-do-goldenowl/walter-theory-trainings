import 'package:unit_test_2/unit_test_2.dart';
import 'package:test/test.dart';

void main() {
  group("test list", () {
    test('divisor', () {
      expect(
        getSameElement(
          [1, 1, 2, 3, 5, 8, 89, 13, 21, 34, 55],
          [1, 2, 3, 4, 5, 6, 10, 7, 8, 9, 11, 12, 13],
        ),
        [1, 2, 3, 5, 8, 13],
      );
    });
  });
}
