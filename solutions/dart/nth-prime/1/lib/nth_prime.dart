class NthPrime {
  int prime(int n) {
    // invalid argument
    if (n < 1) throw ArgumentError('There is no zeroth prime');
    int counter = 1, latestPrime = 2, nextVal = 3;
    while (counter < n) {
      for (int i = 2; i <= nextVal; i++) {
        // next prime found
        if (i == nextVal) {
          counter++;
          latestPrime = nextVal;
        }
        // not a prime
        if (nextVal % i == 0) break;
      }
      nextVal++;
    }
    return latestPrime;
  }
}
