class PhoneNumber {
  late String number;
  PhoneNumber();
  String clean(String input) {
    if (RegExp(r'[a-zA-Z]').hasMatch(input)) {
      throw FormatException('letters not permitted');
    }
    if (RegExp(r'[@:!&,]').hasMatch(input)) {
      throw FormatException('punctuations not permitted');
    }
    final digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 10) {
      throw FormatException('must not be fewer than 10 digits');
    }
    if (digits.length > 11) {
      throw FormatException('must not be greater than 11 digits');
    }
    if (digits.length == 11 && !digits.startsWith('1')) {
      throw FormatException('11 digits must start with 1');
    }
    final cleaned = digits.length == 11 ? digits.substring(1) : digits;
    if (cleaned[0] == '0') throw FormatException('area code cannot start with zero');
    if (cleaned[0] == '1') throw FormatException('area code cannot start with one');
    if (cleaned[3] == '0') throw FormatException('exchange code cannot start with zero');
    if (cleaned[3] == '1') throw FormatException('exchange code cannot start with one');
    number = cleaned;
    return number;
  }
}
