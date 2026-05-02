extension ListOps on List {
  // Ajoute les éléments d'une autre liste à la fin (modifie l'instance)
  void append<T>(List<T> other) {
    for (var item in other) {
      this.add(item);
    }
  }

  // Aplatit une liste de listes en une seule liste
  List<T> concat<T>() {
    List<T> result = [];
    for (var item in this) {
      if (item is List<T>) {
        for (var innerItem in item) {
          result.add(innerItem);
        }
      }
    }
    return result;
  }

  // Retourne une liste contenant uniquement les éléments validés par le prédicat
  List<T> filter<T>(bool Function(T elem) predicate) {
    List<T> result = [];
    for (var item in this) {
      if (predicate(item as T)) {
        result.add(item);
      }
    }
    return result;
  }

  // Compte le nombre d'éléments manuellement
  int count() {
    int counter = 0;
    for (var _ in this) {
      counter++;
    }
    return counter;
  }

  // Applique une fonction à chaque élément et retourne une nouvelle liste
  List<T> myMap<T>(T Function(T elem) fn) {
    List<T> result = [];
    for (var item in this) {
      result.add(fn(item as T));
    }
    return result;
  }

  // Réduction de la gauche vers la droite
  U foldl<T, U>(U initial, U Function(U acc, T elem) fn) {
    U accumulator = initial;
    for (var item in this) {
      accumulator = fn(accumulator, item as T);
    }
    return accumulator;
  }

  // Réduction de la droite vers la gauche
  U foldr<T, U>(U initial, U Function(T elem, U acc) fn) {
    U accumulator = initial;
    var reversedList = this.reverse<T>();
    for (var item in reversedList) {
      accumulator = fn(item, accumulator);
    }
    return accumulator;
  }

  // Inverse l'ordre des éléments
  List<T> reverse<T>() {
    List<T> result = [];
    for (var item in this) {
      result = [item as T, ...result];
    }
    return result;
  }
}
