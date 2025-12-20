import 'dart:convert';
class Diamond {
  List<String> rows(String input) {
    var alphabetPosition = ascii.encode(input).first - 64;
    if (alphabetPosition == 1) {
      return ['A'];
    }
    var result = <String>[];
    // Top of diamond
    for (var i = 1; i <= alphabetPosition; i++) {
      result.add(_createRow(i, alphabetPosition));
    }
    // Bottom of diamond
    for (var i = alphabetPosition - 1; i >= 1; i--) {
      result.add(_createRow(i, alphabetPosition));
    }
    return result;
  }
  String _createRow(int currentLetter, int alphabetPosition) {
    var char = ascii.decode([(currentLetter + 64)]);
    var padding = _numberOfSpaces((alphabetPosition - currentLetter));
    if (char == 'A') {
      return padding + 'A' + padding;
    }
    var inBetweenSpaces = _numberOfSpaces((2 * currentLetter) - 3);
    return padding + char + inBetweenSpaces + char + padding;
  }
  String _numberOfSpaces(int number) {
    return (' ' * number);
  }
}