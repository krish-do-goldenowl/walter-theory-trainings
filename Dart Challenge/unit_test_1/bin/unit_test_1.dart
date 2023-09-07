import 'dart:io';

import 'package:unit_test_1/unit_test_1.dart';

void main(List<String> arguments) {
  int? number = int.tryParse(stdin.readLineSync()!);
  if (number != null) {
    print(getListDivisor(number));
  }
}

