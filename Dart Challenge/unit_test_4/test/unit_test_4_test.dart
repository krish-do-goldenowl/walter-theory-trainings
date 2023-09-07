import 'package:unit_test_4/unit_test_4.dart';
import 'package:test/test.dart';

void main() {
  group("test password", () {
    test('validate', () {
      expect(validatePassword("password"), false);
    });
    test('validate', () {
      expect(validatePassword("1password"), false);
    });
    test('validate', () {
      expect(validatePassword("pa.ssword"), false);
    });
    test('validate', () {
      expect(validatePassword("pass"), false);
    });
    test('validate', () {
      expect(validatePassword("pass1.word"), true);
    });
    test('validate', () {
      expect(validatePassword("pass.2word"), true);
    });
  });
}
