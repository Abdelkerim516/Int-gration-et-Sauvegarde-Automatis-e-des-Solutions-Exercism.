class Isogram {
  // Put your code here
  bool isIsogram(String word){
    word = word.toLowerCase().replaceAll('-','').replaceAll(' ', '');
    return (word.split('').toSet().length == word.split('').length);
  }
}
