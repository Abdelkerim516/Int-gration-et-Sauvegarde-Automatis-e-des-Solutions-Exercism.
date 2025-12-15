import 'dart:math';
class Darts {
  static final circles = {Circle.inner(), Circle.middle(), Circle.outer()};
  int score(num x, num y) => circles
      .firstWhere((circle) => circle.contains(x, y), orElse: () => Circle())
      .score;
}
class Circle {
  final int radius;
  final int score;
  static final _center = Point(0, 0);
  factory Circle.inner() => Circle(1, 10);
  factory Circle.middle() => Circle(5, 5);
  factory Circle.outer() => Circle(10, 1);
  Circle([this.radius = 0, this.score = 0]);
  bool contains(num x, num y) => Point(x, y).distanceTo(_center) <= radius;
}
