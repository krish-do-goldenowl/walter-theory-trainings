List<int> getListDivisor(int number) {
  List<int> divisor = [];
  for (int i = 1; i <= number; i++) {
    if (number % i == 0) {
      divisor.add(i);
    }
  }
  return divisor;
}