class MatchingBrackets {
  static List<List<int>> runesPairs = [
    [123, 125], // {}
    [60, 62], // <>
    [40, 41], // ()
    [91, 93], // []
  ];
  List<int> openingBrackets = runesPairs.map((List<int>ob) => ob[0]).toList();
  List<int> closingBrackets = runesPairs.map((List<int>ob) => ob[1]).toList();
  bool isPaired(String str) {
    List<int> openedBrackets = [];
    for (int rune in str.runes) {
      int openingBracketIndex = openingBrackets.indexOf(rune);
      int closingBracketIndex = closingBrackets.indexOf(rune);
      if (openingBracketIndex >= 0) {
        openedBrackets.add(rune);
        continue;
      }
      if (closingBracketIndex == -1) {
        continue;
      }
      if (
        openedBrackets.length > 0 &&
        openingBrackets[closingBracketIndex] == openedBrackets.last
      ) {
        openedBrackets.removeLast();
      } else {
        return false;
      }
    }
    return openedBrackets.length == 0;
  }
}