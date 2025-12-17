class Pangram {
  // Put your code here
  // Abdel_Abbo
  bool isPangram(String string) =>
      string
          .toLowerCase()
          .replaceAll(new RegExp(r"[^a-z]"), "")
          .split("")
          .toSet()
          .length ==
      26;
}
