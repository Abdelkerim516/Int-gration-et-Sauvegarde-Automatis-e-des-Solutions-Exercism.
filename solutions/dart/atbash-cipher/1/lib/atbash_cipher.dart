class AtbashCipher {
  final Map<String, String> _lookup = {};
  AtbashCipher() {
    final plain = 'zyxwvutsrqponmlkjihgfedcba'; // Alphabet is here
    final cipher = plain.split('').reversed.toList();
    for (int i = 0; i < plain.length; i++) {
      _lookup[plain[i]] = cipher[i];
    }
  }
  String encode(String input) {
    final raw = StringBuffer();
    for (var ch in input.toLowerCase().runes) {
      final char = String.fromCharCode(ch);
      if (_lookup.containsKey(char)) {
        raw.write(_lookup[char]);
      } else if (RegExp(r'\d').hasMatch(char)) {
        raw.write(char);
      }
    }
    final result = StringBuffer();
    final text = raw.toString();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 5 == 0) {
        result.write(' ');
      }
      result.write(text[i]);
    }
    return result.toString();
  }
  String decode(String input) {
    final buffer = StringBuffer();
    for (var ch in input.toLowerCase().runes) {
      final char = String.fromCharCode(ch);
      if (_lookup.containsKey(char)) {
        buffer.write(_lookup[char]);
      } else if (RegExp(r'\d').hasMatch(char)) {
        buffer.write(char);
      }
    }
    return buffer.toString();
  }
}