import 'dart:io';
import 'dart:math';

final List<String> list = ["rock", "paper", "scissors"];

void main(List<String> arguments) {
  print("Welcome to Rock, Paper, Scissors. \nType 'exit' to stop the game");
  int score = 0;
  while (true) {
    print("Please choose Rock, Paper or Scissors:");
    String? choose = stdin.readLineSync();
    if (choose?.compareTo("exit") == 0) break;
    if (choose != null && list.contains(choose)) {
      Random random = Random();
      int value = random.nextInt(3);
      print("The computer chooses the ${list[value]}");
      int result = checkResult(value, list.indexOf(choose.toLowerCase()));
      switch (result) {
        case 0:
          print("draw");
          break;
        case -1:
          score++;
          print("you win");
          break;
        case 1:
          print("you lose");
          break;
      }
    } else {
      print("Input data is not accurate");
    }
  }
  print("Your score is $score");
}

int checkResult(int result1, int result2) {
  if (result1 == 0) {
    switch (result2) {
      case 0:
        return 0;
      case 1:
        return -1;
      case 2:
        return 1;
    }
  } else if (result1 == 1) {
    switch (result2) {
      case 0:
        return 1;
      case 1:
        return 0;
      case 2:
        return -1;
    }
  } else {
    switch (result2) {
      case 0:
        return -1;
      case 1:
        return 1;
      case 2:
        return 0;
    }
  }
  return 0;
}
