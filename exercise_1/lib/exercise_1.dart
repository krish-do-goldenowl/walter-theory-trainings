void drawSquare(int number) {
  for (int i = 0; i < number; i++) {
    String line = "";
    for (int j = 0; j < number; j++) {
      line += " ---";
    }
    print(line);
    String wall = "";
    for (int j = 0; j <= number; j++) {
      wall += "|   ";
    }
    print(wall);
  }
  String line = "";
  for (int j = 0; j < number; j++) {
    line += " ---";
  }
  print(line);
}
