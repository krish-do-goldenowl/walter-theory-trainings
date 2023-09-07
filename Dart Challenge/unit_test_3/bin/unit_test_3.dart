import 'dart:io';

import 'package:unit_test_3/unit_test_3.dart';

void main(List<String> arguments) {
  int? number = int.tryParse(stdin.readLineSync()!);
  if (number != null) {
    print(checkPrimes(number));
  }
}
