class EmptyBufferException implements Exception {}
class FullBufferException implements Exception {}
class CircularBuffer {
  int size;
  List<int> output = [];
  CircularBuffer(this.size);
  void clear() {
    this.output = [];
  }
  int read() {
    if (this.output.isEmpty) throw EmptyBufferException();
    return this.output.removeAt(0);
  }
  void write(int item, {bool force = false}) {
    if (this.output.length == this.size) {
      if (!force) throw FullBufferException();
      read();
    }
    this.output.add(item);
  }
}