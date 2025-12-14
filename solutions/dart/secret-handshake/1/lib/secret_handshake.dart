class SecretHandshake {
  Map<int, String> values = {
    0: 'wink',
    1: 'double blink',
    2: 'close your eyes',
    3: 'jump',
    4: 'reverse',
  };
  List<String> commands(int number) {
    List<String> binaryNumber =
        number.toRadixString(2).split('').reversed.toList();
    List<String> result = [];
    for (int i = 0; i < binaryNumber.length; i++) {
      if (binaryNumber[i] == '1') {
        result.add(values[i] ?? '');
      }
    }
    if (result.isNotEmpty && result.last == 'reverse') {
      result.remove('reverse');
      return result.reversed.toList();
    }
    return result;
  }
}
