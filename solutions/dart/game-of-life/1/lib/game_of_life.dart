class GameOfLife {
  // Put your code here
 List<List<int>> _matrix;

  
  GameOfLife(List<List<int>> matrix) : _matrix = matrix;
  void tick() {
    if (_matrix.isEmpty || _matrix[0].isEmpty) return;
    final rows = _matrix.length;
    final cols = _matrix[0].length;
    final nextGen = List.generate(rows, (_) => List.filled(cols, 0));
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        int liveNeighbors = 0;
        for (int x = -1; x <= 1; x++) {
          for (int y = -1; y <= 1; y++) {
            if (x == 0 && y == 0) continue;
            final ni = i + x;
            final nj = j + y;
            if (ni >= 0 && ni < rows && nj >= 0 && nj < cols) {
              liveNeighbors += _matrix[ni][nj];
            }
          }
        }
        if (_matrix[i][j] == 1) {
          nextGen[i][j] = (liveNeighbors == 2 || liveNeighbors == 3) ? 1 : 0;
        } else {
          nextGen[i][j] = (liveNeighbors == 3) ? 1 : 0;
        }
      }
    }
    _matrix = nextGen;
  }
  List<List<int>> matrix() => _matrix;

}
