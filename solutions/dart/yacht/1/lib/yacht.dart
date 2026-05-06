import 'package:yacht/categories.dart';
class Yacht {
  List<int> dices;
  Yacht(this.dices);
  int score(Category c) {
    int s;
    switch (c) {
      case Category.yacht:
        if (is_yacht(dices)) {
          s = 50;
        } else {
          s = 0;
        }
        break;
      case Category.ones:
        s = dices
            .where((element) => element == 1)
            .fold(0, (value, element) => value + element);
        break;
      case Category.twos:
        s = dices
            .where((element) => element == 2)
            .fold(0, (value, element) => value + element);
        break;
      case Category.threes:
        s = dices
            .where((element) => element == 3)
            .fold(0, (value, element) => value + element);
        break;
      case Category.fours:
        s = dices
            .where((element) => element == 4)
            .fold(0, (value, element) => value + element);
        break;
      case Category.fives:
        s = dices
            .where((element) => element == 5)
            .fold(0, (value, element) => value + element);
        break;
      case Category.sixes:
        s = dices
            .where((element) => element == 6)
            .fold(0, (value, element) => value + element);
        break;
      case Category.full_house:
        if (is_yacht(dices)) {
          s = 0;
        } else {
          try {
            int the_two = dices.firstWhere(
                (element) => dices.where((n) => n == element).length == 2);
            int the_three = dices.firstWhere(
                (element) => dices.where((n) => n == element).length == 3);
            s = the_three * 3 + the_two * 2;
          } catch (e) {
            s = 0;
          }
        }
        break;
      case Category.four_of_a_kind:
        try {
          int the_four = dices.firstWhere(
              (element) => dices.where((n) => n == element).length >= 4);
          s = the_four * 4;
        } catch (e) {
          s = 0;
        }
        break;
      case Category.little_straight:
        dices.sort((a, b) => a.compareTo(b));
        if (dices[0] == 1 &&
            dices[1] == 2 &&
            dices[2] == 3 &&
            dices[3] == 4 &&
            dices[4] == 5) {
          s = 30;
        } else {
          s = 0;
        }
        break;
      case Category.big_straight:
        dices.sort((a, b) => a.compareTo(b));
        if (dices[0] == 2 &&
            dices[1] == 3 &&
            dices[2] == 4 &&
            dices[3] == 5 &&
            dices[4] == 6) {
          s = 30;
        } else {
          s = 0;
        }
        break;
      case Category.choice:
        s = dices.fold(0, (previousValue, element) => previousValue + element);
        break;
      default:
        s = 0;
        break;
    }
    return s;
  }
}
bool is_yacht(List<int> dices) {
  return dices.every((element) => element == dices[0]);
}