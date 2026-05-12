class SpiralMatrix {
  final List<List<int>> _matrix;
  SpiralMatrix(int size) : _matrix = _generateMatrix(size);
  static List<List<int>> _generateMatrix(int size) {
    List<List<int>> matrix = List.generate(size, (_) => List.filled(size, 0));
    int value = 1;
    int top = 0, bottom = size - 1;
    int left = 0, right = size - 1;
    while (top <= bottom && left <= right) {
      for (int i = left; i <= right; i++) matrix[top][i] = value++;
      top++;
      for (int i = top; i <= bottom; i++) matrix[i][right] = value++;
      right--;
      for (int i = right; i >= left; i--) matrix[bottom][i] = value++;
      bottom--;
      for (int i = bottom; i >= top; i--) matrix[i][left] = value++;
      left++;
    }
    return matrix;
  }
  List<List<int>> toList() => _matrix;
}