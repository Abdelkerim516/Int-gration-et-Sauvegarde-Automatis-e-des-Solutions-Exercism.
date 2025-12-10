class RnaTranscription {
  // Put your code here
  // Abdel-Abbo
  String toRna(String dna) {
    var map = {
      'G': 'C',
      'C': 'G',
      'T': 'A',
      'A': 'U',
    };
    return dna.toUpperCase().split('').fold('', (acc, n) {
      var r = map[n];
      if(r == null) throw ArgumentError();
      return acc + r;
    });
  }
}
