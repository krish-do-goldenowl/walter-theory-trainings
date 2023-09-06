import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print("Welcome to Cows and Bulls\nType 'exit' to stop the game");
  Random random = Random();
  String value = (random.nextInt(9000) + 1000).toString();
  while (true) {
    print("Please choose a four digit number:");
    String? number = stdin.readLineSync();
    if (number?.compareTo("exit") == 0) break;
    if (int.tryParse(number!) == null || number.length != 4) {
      print("non-numeric input data");
    } else if (value.compareTo(number) == 0) {
      print("You win");
      break;
    } else {
      checkNumber(value, number);
    }
  }
}

void checkNumber(String random, String input) {
  int cows = 0;
  int bulls = 0;
  for (int i = 0; i < input.length; i++) {
    if (random.contains(input[i])) {
      if (random.indexOf(input[i]) == i) {
        cows++;
      } else {
        bulls++;
      }
    }
  }
  print("Attempts: $input \nCows: $cows, Bulls: $bulls");
}
