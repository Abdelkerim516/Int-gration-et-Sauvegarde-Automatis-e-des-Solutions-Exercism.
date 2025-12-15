class Luhn {
  bool valid(String stringToValidate) {
    /* Validate String */
    RegExp invalidChars = RegExp(r'[^\d ]');
    String cleanedString = stringToValidate.replaceAll(invalidChars, "");
    List<String> noSpaces = cleanedString.runes
        .map((int letterCode) => String.fromCharCode(letterCode))
        .where((String letter) => letter != " ")
        .toList();
    if (cleanedString != stringToValidate || noSpaces.length < 2) {
      return false;
    }
    Iterable<int> luhnDigits = noSpaces.map((digit) => int.parse(digit));
    /* Calculate indexes that need to be doubled */
    Iterable<int> everySecondNum() sync* {
      for (int posCounter = luhnDigits.length - 2;
          posCounter >= 0;
          posCounter -= 2) {
        yield posCounter;
      }
    }
    /* Double every second digit from the right */
    List<int> doubledDigits = List.from(luhnDigits);
    for (int index in everySecondNum()) {
      int digit = doubledDigits[index];
      int newDigit = digit * 2;
      if (newDigit > 9) {
        newDigit -= 9;
      }
      doubledDigits[index] = newDigit;
    }
    /* Check if the digits are evenly divisible by 10 */
    return doubledDigits.reduce((int a, int b) => a + b) % 10 == 0;
  }
}

