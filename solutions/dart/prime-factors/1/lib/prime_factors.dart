class PrimeFactors {
  // Abdel_Abbo
  List<int> factors(int n) {
    List<int> r = [];
    int i = 1;
    while (n > 1) {
      i++;
      if (n % i == 0) {
        r.add(i);
        n = n ~/ i;
        i = 1;
      }
    }
    return r;
  }
}
