String translate(String word) {
  List<String> words = word.split(' ');
  if (words.length > 1) {
    List<String> newWords = [];
    for (var wo in words) {
      newWords.add(translate(wo));
    }
    return newWords.join(' ');
  }
  RegExp vowelSound = RegExp(r'^[aeiou]|(xr)|(yt)');
  RegExp consoante = RegExp(r'^[bcdfghjklmnpqrstvwxys]+');
  RegExp consoanteQU = RegExp(r'^[bcdfghjklmnpqrstvwxys]{0,1}qu');
  if (word.startsWith(vowelSound)) {
    return word + 'ay';
  } else {
    if (consoanteQU.hasMatch(word)) {
      var result = consoanteQU.firstMatch(word)?.group(0);
      return word.replaceFirst(result.toString(), '') +
          result.toString() +
          'ay';
    }
    if (consoante.hasMatch(word)) {
      var result = consoante.firstMatch(word)?.group(0);
      int? yIndex = result?.indexOf('y');
      if (yIndex != null && yIndex > 0) {
        result = result!.substring(0, yIndex);
      }
      return word.replaceFirst(result.toString(), '') +
          result.toString() +
          'ay';
    }
  }
  return '';
}