class WordCount {
  // Abdel_Abbo
  WordCount();  // Add this  constructeur
  Map<String, int> countWords(String text) {
    List<String> words = text.toLowerCase().split(RegExp(r"\s+|[,\n]"));
    Map<String, int> wordCounts = {};
    for (String word in words) {
      word = word.replaceAll(RegExp(r"^\W+|\W+$"), '');
      
      if (word.isEmpty) continue;
      if (word.contains("'")) {
        if (word.endsWith("'s")) {
          word = word.substring(0, word.length - 2);
        }
      }
      wordCounts[word] = (wordCounts[word] ?? 0) + 1;
    }
    return wordCounts;
  }
}
