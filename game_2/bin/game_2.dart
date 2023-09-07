import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print("Type 'exit' to quit the game");
  Random random = Random();
  int result = random.nextInt(100) + 1;
  int count = 0;
  while (true) {
    count++;
    print("Please choose a number between 1 and 100:");
    String? value = stdin.readLineSync();
    int? number = int.tryParse(value!);
    if (value.contains("exit")) break;
    if (number != null) {
      if (number < result) {
        print("You are lower");
      } else if (number > result) {
        print("You are higher");
      } else {
        print("Bingo! You tried $count times");
        break;
      }
    } else {
      print("The input data is not a number");
    }
  }
}
