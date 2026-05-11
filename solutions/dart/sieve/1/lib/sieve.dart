class Sieve {
  final int limit;
  Sieve(this.limit);
  List<int> get primes {
    if (limit < 2) return [];
    final isPrime = List<bool>.filled(limit + 1, true);
    isPrime[0] = false;
    isPrime[1] = false;
    for (int i = 2; i * i <= limit; i++) {
      if (isPrime[i]) {
        for (int j = i * i; j <= limit; j += i) {
          isPrime[j] = false;
        }
      }
    }
    final primeList = <int>[];
    for (int i = 2; i <= limit; i++) {
      if (isPrime[i]) primeList.add(i);
    }
    return primeList;
  }
}