class PascalsTriangle {
  Map<int, int> fatorialMemo = {
    0: 1,
    1: 1,
  };
  int fatorial(int f) {
    if (fatorialMemo.containsKey(f)) {
      return fatorialMemo[f]!;
    }
    var previousFatorial = fatorial(f - 1);
    fatorialMemo[f] = f * previousFatorial;
    return fatorialMemo[f]!;
  }
  int combinatorics(int n, int p) {
    int r = fatorial(n) ~/ (fatorial(p) * fatorial(n - p));
    return r;
  }
  Map<int, List<int>> pascalTriangleMemo = {
    0: [1],
  };
  List<List<int>> rows(int rowsNumber) {
    if (rowsNumber == 0) {
      return [];
    }
    List<List<int>> pascalTriangle = [];
    for (var i = 0; i < rowsNumber; i++) {
      if (pascalTriangleMemo.containsKey(i)) {
        pascalTriangle.add(pascalTriangleMemo[i]!);
      } else {
        List<int> pascalTriangleRow = List.filled(i + 1, i);
        for (var j = 0; j < pascalTriangleRow.length; j++) {
          pascalTriangleRow[j] = combinatorics(i, j);
        }
        pascalTriangleMemo[i] = pascalTriangleRow;
        pascalTriangle.add(pascalTriangleRow);
      }
    }
    return pascalTriangle;
  }
}