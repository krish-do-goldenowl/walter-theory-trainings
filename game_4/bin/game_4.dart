import 'dart:io';
import 'dart:math';

const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
Random random = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(random.nextInt(_chars.length))));

void main(List<String> arguments) {
  print("Type 'exit' to stop the game");
  String wordRandom = getRandomString(random.nextInt(10) + 5);
  String tempString = "_" * wordRandom.length;
  print(tempString);
  while (true) {
    print("Please guess a letter:");
    String? input = stdin.readLineSync();
    if (input?.compareTo("exit") == 0) break;
    if (input?.length == 1) {
      for (int i = 0; i < wordRandom.length; i++) {
        if (wordRandom[i].compareTo(input!.toUpperCase()) == 0) {
          tempString = replaceCharAt(tempString, i, input.toUpperCase());
        }
      }
    } else {
      print("Input data is incorrect");
    }
    print(tempString);
    if (wordRandom.compareTo(tempString) == 0) {
      print("You win");
      break;
    }
  }
}

String replaceCharAt(String oldString, int index, String newChar) =>
    oldString.substring(0, index) + newChar + oldString.substring(index + 1);
