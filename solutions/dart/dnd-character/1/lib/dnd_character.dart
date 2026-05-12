import 'dart:math';
class DndCharacter {
  final int strength = ability();
  final int constitution = ability();
  final int intelligence = ability();
  final int wisdom = ability();
  final int charisma = ability();
  final int dexterity = ability();
  int dicesCount = 4;
  int sidesCount = 6;
  static DndCharacter create() {
    var d = DndCharacter();
    return d;
  }
  int get hitpoints => 10 + modifier(constitution);
  static int modifier(int n) => n ~/ 2 - 5;
  static int ability() => diceRoll(4, 6).skip(1).reduce((a, b) => a + b);
  static List<int> diceRoll(int dicesCount, int sidesCount) =>
      [for (int i = 0; i < dicesCount; i++) (1 + Random().nextInt(sidesCount))]..sort();
}
