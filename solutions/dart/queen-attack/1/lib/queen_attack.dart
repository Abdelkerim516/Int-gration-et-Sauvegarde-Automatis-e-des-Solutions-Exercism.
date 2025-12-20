class Queen {
  int x = 0;
  int y = 0;
  Queen(int x, y) {
    if (x < 0) {
      throw AssertionError("row not positive");
    } else if (x > 7) {
      throw AssertionError("row not on board");
    } else if (y < 0) {
      throw AssertionError("column not positive");
    } else if (y > 7) {
      throw AssertionError("column not on board");
    } else {
      this.x = x;
      this.y = y;
    }
  }
  bool canAttack(Queen queen) {
    return this.x == queen.x || this.y == queen.y || (this.x - queen.x).abs() == (this.y - queen.y).abs();
  }
}