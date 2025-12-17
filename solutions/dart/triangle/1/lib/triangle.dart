class Triangle {
  bool _isValid(double a, double b, double c) {
    return a > 0 && b > 0 && c > 0 &&
           a + b > c &&
           a + c > b &&
           b + c > a;
  }
  bool equilateral(num a, num b, num c) {
    if (!_isValid(a.toDouble(), b.toDouble(), c.toDouble())) {
      return false;
    }
    return a == b && b == c;
  }
  bool isosceles(num a, num b, num c) {
    if (!_isValid(a.toDouble(), b.toDouble(), c.toDouble())) {
      return false;
    }
    return a == b || b == c || a == c;
  }
  bool scalene(num a, num b, num c) {
    if (!_isValid(a.toDouble(), b.toDouble(), c.toDouble())) {
      return false;
    }
    return a != b && b != c && a != c;
  }
}
