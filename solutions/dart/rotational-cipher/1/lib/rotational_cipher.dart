class RotationalCipher {
  static const int lower = 65; // 'a' value
  static const int upper = 97; // 'A'  value
  static const int len = 26; // alphbet

  String rotate ({required String text, required int shiftKey}) => text.runes.toList().map((x) => String.fromCharCode(rotatedCode(x, shiftKey))).join();
  int rotatedCode(int code, int shift) => switch (code) {
      >= lower && < lower + len => (code + shift - lower) % len + lower,
      >= upper && < upper + len => (code + shift - upper) % len + upper, _ => code
  };
}
