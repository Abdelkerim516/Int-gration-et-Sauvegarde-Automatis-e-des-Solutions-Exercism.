class AllYourBase {
  List<int> rebase(int inBase, List<int> inDigits, int outBase) {
    if (inBase < 2 || outBase < 2) throw ArgumentError("invalid base");
    if (inDigits.any((d) => d < 0 || d >= inBase)) throw ArgumentError("invalid digit");
    var dec = inDigits.fold(0, (sum, d) => sum * inBase + d);
    if (dec == 0) return [0];
    List<int> res = [];
    while (dec > 0) {
      res.insert(0, dec % outBase);
      dec ~/= outBase;
    }
    return res;
  }
}