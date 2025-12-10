class SumOfMultiples {
  // Abdel-Abbo
  int sum(List<int> factors, int limit) {
    // Use a Set to automatically handle unique multiples
    final multiples = <int>{};

    // Iterate through potential multiples up to (but not including) the limit
    for (int i = 1; i < limit; i++) {
      // Check if 'i' is a multiple of any non-zero factor
      if (factors.any((factor) => factor != 0 && i % factor == 0)) {
        multiples.add(i); // Add to the set
      }
    }

    // Sum all the unique multiples
    return multiples.fold(0, (acc, val) => acc + val);
  }
}
