class BinarySearchTree {
  // Abdel_Abbo
  late Pidor root;
  BinarySearchTree(String s) {
    this.root = Pidor(data: s, num: int.parse(s));
  }
  void insert(String s) {
    var newPidor = Pidor(data: s, num: int.parse(s));
    insertPidor(root, newPidor);
  }
  void insertPidor(Pidor oldFaggot, Pidor newPidor) {
    oldFaggot.num >= newPidor.num
        ? oldFaggot.left == null
            ? oldFaggot.left = newPidor
            : insertPidor(oldFaggot.left!, newPidor)
        : oldFaggot.right == null
            ? oldFaggot.right = newPidor
            : insertPidor(oldFaggot.right!, newPidor);
  }
  List<String> sortData() {
    var suka = <String>[];
    dig(suka, root);
    suka.sort();
    return suka;
  }
  void dig(List<String> suka, Pidor gavno) {
    suka.add(gavno.data);
    if (gavno.left != null) {
      dig(suka, gavno.left!);
    }
    if (gavno.right != null) {
      dig(suka, gavno.right!);
    }
  }
  List<String> get sortedData => sortData();
}
class Pidor {
  String data;
  int num;
  Pidor? left;
  Pidor? right;
  Pidor({
    required this.data,
    required this.num,
  });
}
