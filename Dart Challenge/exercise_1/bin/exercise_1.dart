import 'dart:io';

import 'package:exercise_1/exercise_1.dart';

void main(List<String> arguments) {
  int? number = int.tryParse(stdin.readLineSync()!);
  if (number != null) {
    drawSquare(number);
  }
}
