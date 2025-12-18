import 'package:robot_simulator/orientation.dart';
import 'package:robot_simulator/position.dart';
class Robot {
  final int orientation_len = Orientation.values.length;
  // Put your code here
  Position position;
  Orientation orientation;
  Robot(this.position, this.orientation);
  void move(String instructions) =>
      instructions.split('').forEach((f) => obey(f));
  void obey(String movement) {
    if (movement == 'A') {
      advance();
    } else {
      turn(movement);
    }
  }
  void advance() {
    switch (this.orientation) {
      case Orientation.north:
        this.position.y += 1;
        break;
      case Orientation.east:
        this.position.x += 1;
        break;
      case Orientation.south:
        this.position.y -= 1;
        break;
      case Orientation.west:
        this.position.x -= 1;
        break;
    }
  }
  void turn(String direction) {
    int index = direction == 'R'
        ? this.orientation.index + 1
        : this.orientation.index - 1;
    this.orientation =
        Orientation.values[((orientation_len + index) % orientation_len)];
  }
}
