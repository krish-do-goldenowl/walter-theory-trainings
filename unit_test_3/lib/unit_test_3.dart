import 'dart:math';

bool checkPrimes(int number) {
  if (number < 2) {
    return false;
  } else {
    for (int i = 2; i <= sqrt(number); i++) {
      if (number % i == 0) {
        return false;
      }
    }
  }
  return true;
}
