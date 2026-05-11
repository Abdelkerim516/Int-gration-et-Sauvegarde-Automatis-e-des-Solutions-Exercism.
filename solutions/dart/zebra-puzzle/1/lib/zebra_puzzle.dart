class ZebraPuzzle {
  late List<House> _houses;
  void solve() {
    _houses = _solvePuzzle();
  }
  String get drinksWater =>
      _houses.firstWhere((house) => house.drink == 'water').nationality;
  String get ownsZebra =>
      _houses.firstWhere((house) => house.pet == 'zebra').nationality;
  List<House> _solvePuzzle() {
    const colors = ['red', 'green', 'ivory', 'yellow', 'blue'];
    const nationalities = ['Englishman', 'Spaniard', 'Ukrainian', 'Norwegian', 'Japanese'];
    const pets = ['dog', 'snails', 'fox', 'horse', 'zebra'];
    const drinks = ['coffee', 'tea', 'milk', 'orange juice', 'water'];
    const hobbies = ['reading', 'dancing', 'painter', 'football', 'chess'];
    final permutations = _permute;
    for (final color in permutations(colors)) {
      if (color.indexOf('green') != color.indexOf('ivory') + 1) continue;
      for (final nationality in permutations(nationalities)) {
        if (nationality[color.indexOf('red')] != 'Englishman') continue;
        if (nationality[0] != 'Norwegian') continue;
        if ((color.indexOf('blue') - nationality.indexOf('Norwegian')).abs() != 1) continue;
        for (final pet in permutations(pets)) {
          if (nationality[pet.indexOf('dog')] != 'Spaniard') continue;
          for (final drink in permutations(drinks)) {
            if (drink[color.indexOf('green')] != 'coffee') continue;
            if (drink[nationality.indexOf('Ukrainian')] != 'tea') continue;
            if (drink[2] != 'milk') continue;
            for (final hobby in permutations(hobbies)) {
              if (hobby[pet.indexOf('snails')] != 'dancing') continue;
              if (hobby[color.indexOf('yellow')] != 'painter') continue;
              if (drink[hobby.indexOf('football')] != 'orange juice') continue;
              if (hobby[nationality.indexOf('Japanese')] != 'chess') continue;
              if ((hobby.indexOf('reading') - pet.indexOf('fox')).abs() != 1) continue;
              if ((hobby.indexOf('painter') - pet.indexOf('horse')).abs() != 1) continue;
              return List.generate(
                5,
                (i) => House(
                  color: color[i],
                  nationality: nationality[i],
                  pet: pet[i],
                  drink: drink[i],
                  hobby: hobby[i],
                ),
              );
            }
          }
        }
      }
    }
    throw Exception('No solution found');
  }
  Iterable<List<T>> _permute<T>(List<T> items) sync* {
    if (items.length == 1) {
      yield items;
    } else {
      for (int i = 0; i < items.length; i++) {
        final rest = List<T>.from(items)..removeAt(i);
        for (final perm in _permute(rest)) {
          yield [items[i], ...perm];
        }
      }
    }
  }
}
class House {
  final String color;
  final String nationality;
  final String pet;
  final String drink;
  final String hobby;
  House({
    required this.color,
    required this.nationality,
    required this.pet,
    required this.drink,
    required this.hobby,
  });
  @override
  String toString() {
    return 'House(color: $color, nationality: $nationality, pet: $pet, drink: $drink, hobby: $hobby)';
  }
}