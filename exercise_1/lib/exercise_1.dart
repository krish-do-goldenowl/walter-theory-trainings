void drawSquare(int number) {
  String line = "";
  String wall = number > 0 ? "|   " : "";
  for (int j = 0; j < number; j++) {
    line += " ---";
    wall += "|   ";
  }
  for (int i = 0; i < number; i++) {
    print(line);
    print(wall);
  }
  print(line);
}
