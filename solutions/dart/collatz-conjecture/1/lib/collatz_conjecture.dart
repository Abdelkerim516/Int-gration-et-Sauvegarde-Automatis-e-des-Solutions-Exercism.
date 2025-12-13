class CollatzConjecture {
  int steps(int value) {
    if (value < 1 ) {
      throw ArgumentError('Only positive integers are allowed');
    }
    int count = 0;
    while (value > 1) {
      if (value % 2 == 0) {
        value = value ~/ 2;
      } else {
        value = value * 3 + 1;
      }
      count++;
    }
    return count;
  }
}
