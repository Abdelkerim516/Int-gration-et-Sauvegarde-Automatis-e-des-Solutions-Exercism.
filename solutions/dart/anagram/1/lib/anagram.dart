class Anagram {
  // Abdel_Abbo
  List<String> findAnagrams(String str, List<String> list) {
    List<String> result = [];
    String sorted = sortAnagram(str);
    for (String word in list) {
      if (sorted == sortAnagram(word) &&
          str.toLowerCase() != word.toLowerCase()) {
        result.add(word);
      }
    }
    return result;
  }
  String sortAnagram(String str) {
    List<String> treated = str.toLowerCase().split('');
    treated.sort();
    return treated.join('');
  }
}
