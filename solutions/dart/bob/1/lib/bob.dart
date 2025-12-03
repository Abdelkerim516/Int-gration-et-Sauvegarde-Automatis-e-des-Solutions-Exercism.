class Bob {
  // Abdel_Abbo
  String response(String saying) => saying.isQuestion && saying.isYelling
      ? "Calm down, I know what I'm doing!"
      : saying.isQuestion
          ? 'Sure.'
          : saying.isYelling
              ? 'Whoa, chill out!'
              : saying.isNorthing
                  ? 'Fine. Be that way!'
                  : 'Whatever.';
}
extension on String {
  bool get isQuestion => this.trim().endsWith("?");
  bool get isYelling =>
      this == this.toUpperCase() && this != this.toLowerCase();
  bool get isNorthing => trim().isEmpty;
}