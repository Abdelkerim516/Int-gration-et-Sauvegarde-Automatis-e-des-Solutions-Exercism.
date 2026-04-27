class ProteinTranslation {
  List<String> translate(String s) {
    List<String> _proteins = [];
    var toRna = {
      'AUG': 'Methionine',
      'UUU': 'Phenylalanine',
      'UUC': 'Phenylalanine',
      'UUA': 'Leucine',
      'UUG': 'Leucine',
      'UCU': 'Serine',
      'UCC': 'Serine',
      'UCA': 'Serine',
      'UCG': 'Serine',
      'UAU': 'Tyrosine',
      'UAC': 'Tyrosine',
      'UGU': 'Cysteine',
      'UGC': 'Cysteine',
      'UGG': 'Tryptophan',
    };
    for (var i = 0; i < s.length; i += 3) {
      if (s.substring(i, i + 3) == 'UAG' || s.substring(i, i + 3) == 'UAA' || s.substring(i, i + 3) == 'UGA') {
        break;
      }
      if (!toRna.containsKey(s.substring(i, i + 3))) {
        throw ArgumentError('Invalid codon');
      }
      _proteins.add(toRna[s.substring(i, i + 3)]!);
    }
    return _proteins;
  }
}