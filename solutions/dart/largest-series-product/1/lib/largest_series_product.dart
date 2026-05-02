class LargestSeriesProduct {
  int largestProduct(String digits, int span) {
    // Validations
    if (span < 0) {
      throw ArgumentError('span must not be negative');
    }
    if (digits.isEmpty && span > 0) {
      throw ArgumentError('span must be smaller than string length');
    }
    if (span > digits.length) {
      throw ArgumentError('span must be smaller than string length');
    }
    if (!RegExp(r'^\d*$').hasMatch(digits)) {
      throw ArgumentError('digits input must only contain digits');
    }
    // Special case: product of empty span is defined as 1
    if (span == 0) return 1;
    int maxProduct = 0;
    for (int i = 0; i <= digits.length - span; i++) {
      final window = digits.substring(i, i + span);
      final product = window.split('').fold<int>(
        1,
        (prod, char) => prod * int.parse(char),
      );
      if (product > maxProduct) {
        maxProduct = product;
      }
    }
    return maxProduct;
  }
}