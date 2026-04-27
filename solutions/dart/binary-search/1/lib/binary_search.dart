import 'package:binary_search/value_not_found_exception.dart';
class BinarySearch {
  BinarySearch(this.songs);
  List<int> songs;
  int find(int songTitle) {
    int left = 0, right = songs.length - 1;
    int middle;
    while (left <= right) {
      middle = (left + right) ~/ 2;
      if (songs[middle] < songTitle) {
        left = middle + 1;
      } else if (songs[middle] > songTitle) {
        right = middle - 1;
      } else {
        return middle;
      }
    }
    throw ValueNotFoundException('song not available');
  }
}
